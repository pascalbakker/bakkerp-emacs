;;; emms.el -*- lexical-binding: t; -*-

(use-package emms
  :config
  (require 'emms-setup)
  (require 'emms-mpris)
  (emms-all)
  (emms-default-players)
  (emms-mpris-enable)
  ;;:custom
  ;;(emms-browser-covers #'emms-browser-cache-thumbnail-async)
  :bind
  (("C-c w m b" . emms-browser)
   ("C-c w m e" . emms)
   ("C-c w m p" . emms-play-playlist )
   ("<XF86AudioPrev>" . emms-previous)
   ("<XF86AudioNext>" . emms-next)
   ("<XF86AudioPlay>" . emms-pause)))

(map! :leader
      :desc "EMMS Browse by Title"
      "s t" #'emms-browser-search-by-title)

;; Persist music across sessions
(require 'emms-history)

(defun my/emms-custom ()
  (interactive)
  (delete-other-windows)

  (let* ((left (selected-window))
         (right (split-window left nil 'right))
         (left-top left)
         (left-bottom (split-window left-top (- (window-height) 20) 'below)))

    ;; Left top: Playlist
    (with-selected-window left-top
      (emms)) ;; opens EMMS playlist

    ;; Left bottom: Overview
    (with-selected-window left-bottom
      (let ((buf (get-buffer "*EMMS Overview*")))
        (if buf
            (switch-to-buffer buf)
          (switch-to-buffer (get-buffer-create "*EMMS Overview*"))
          (insert "EMMS Overview Window.\n Add a song to display information")
          (center-text))))

    ;; Right: Browser
    (with-selected-window right
      (emms-browser))))

;; EMMS new line hook
(defun my-emms-ensure-newline-at-top ()
  "Ensure `*EMMS Playlist*` buffer always has a blank line at the top."
  (when (string= (buffer-name) "*EMMS Playlist*")
    (save-excursion
      (goto-char (point-min))
      ;; If first line is not empty, insert a newline at top
      (unless (looking-at-p "^$")
        (insert "\n")))))

;; Add to playlist mode hook so it runs whenever playlist buffer loads
(add-hook 'emms-playlist-mode-hook #'my-emms-ensure-newline-at-top)

;; Optional: run on buffer display, just in case
(add-hook 'window-configuration-change-hook
          (lambda ()
            (when-let ((buf (get-buffer "*EMMS Playlist*")))
              (with-current-buffer buf
                (my-emms-ensure-newline-at-top)))))

;; Update on song change
(add-hook 'emms-playlist-selection-changed-hook
          (lambda ()
            (read-only-mode 0)
            (display-cover-art)
            (read-only-mode 1)))

(defun create-controls ()
  (interactive)
  (with-current-buffer "*EMMS Controls*"
    ;; Buttons for pause play seek
    (let ((inhibit-read-only t)
          (inhibit-modification-hooks t)
          (inhibit-point-motion-hooks t)
          (inhibit-modification-hooks t)
          (redisplay-dont-pause t)
          (inhibit-redisplay t))
      (setq mode-line-format nil)
      (insert-button " ⏸ "
                     'action (lambda (_) (emms-pause))
                     'follow-link t
                     'face '(:box t :background "gray20" :foreground "white" :weight bold :height 2.0))
      (insert "  ")
      (insert-button " ⏪ "
                     'action (lambda (_) (emms-seek-backward))
                     'follow-link t
                     'face '(:box t :background "gray20" :foreground "white" :weight bold :height 2.0))
      (insert "  ")
      (insert-button " ⏩ "
                     'action (lambda (_) (emms-seek-forward))
                     'follow-link t
                     'face '(:box t :background "gray20" :foreground "white" :weight bold :height 2.0))
      (insert "  ")
      (insert-button " ⏮ "
                     'action (lambda (_) (emms-previous))
                     'follow-link t
                     'face '(:box t :background "gray20" :foreground "white" :weight bold :height 2.0))
      (insert "  ")
      (insert-button " ⏭ "
                     'action (lambda (_) (emms-next))
                     'follow-link t
                     'face '(:box t :background "gray20" :foreground "white" :weight bold :height 2.0))
      (insert-button " Clear "
                     'action (lambda (_) (emms-playlist-clear))
                     'follow-link t
                     'face '(:box t :background "gray20" :foreground "white" :weight bold :height 2.0))
      (read-only-mode 1)
      (redisplay)
      (center-text))))
(defvar my/emms-last-song nil)

(defun display-cover-art ()
  (let ((current (find-file-name-from-current-song)))
    (unless (equal current my/emms-last-song)
      (setq my/emms-last-song current)
      (when current
        (with-current-buffer "*EMMS Overview*"
          (let ((inhibit-read-only t))
            (erase-buffer)
            (setq mode-line-format nil)
            (remove-images 0 2 "*EMMS Overview*")
            (set-album-art-from-filepath current)
            (goto-char 3)
            (insert (create-info-table))))))))

(defun get-file-extension-from-filepath (file-path)
  (let* ((ext (file-name-extension file-path))  ;; ext is a string like "jpg"
         (ext-sym (and ext (intern ext))))       ;; convert to symbol 'jpg
    ext-sym))

(defun create-image-from-filepath (file-full-path)
  (when file-full-path
    (create-image file-full-path
                  nil
                  nil
                  :width 300
                  :height 300)))

;; Set album art
(defun set-album-art-from-filepath (filename)
  ( let* ((album-directory (file-name-directory filename))
          (cover-art-path (find-first-cover-or-image album-directory))
          (cover-art (create-image-from-filepath cover-art-path)))
    (with-current-buffer "*EMMS Overview*"
      (when cover-art-path
        (put-image cover-art 1)))))

(defun find-file-name-from-current-song ()
  (cdr (assoc 'name (emms-playlist-current-selected-track))))

(defvar my/cover-art-cache (make-hash-table :test 'equal))

(defun find-first-cover-or-image (directory)
  (or (gethash directory my/cover-art-cache)
      (let ((case-fold-search t)
            (files (directory-files directory t ".*")))
        (let ((result (or
                       (seq-find (lambda (f)
                                   (string-match-p
                                    "\\`cover\\.\\(jpg\\|jpeg\\|png\\)\\'"
                                    (file-name-nondirectory f)))
                                 files)
                       (seq-find (lambda (f)
                                   (string-match-p
                                    "\\`.*\\.\\(jpg\\|jpeg\\|png\\|gif\\|bmp\\)\\'"
                                    (file-name-nondirectory f)))
                                 files))))
          (puthash directory result my/cover-art-cache)
          result))))

(defun find-title-from-current-song ()
  (cdr (assoc 'info-title (emms-playlist-current-selected-track))))

(defun find-album-from-current-song ()
  (cdr (assoc 'info-album (emms-playlist-current-selected-track))))

(defun find-artist-from-current-song ()
  (cdr (assoc 'info-artist (emms-playlist-current-selected-track))))

(defun create-info-table ()
  (format
   (concat
    "\n"
    "Title: %s\n"
    "Album:  %s\n"
    "Artist: %s\n")
   (find-title-from-current-song)
   (find-album-from-current-song)
   (find-artist-from-current-song)))

;; EMMS progress bar

(defun create-progress-bar ()
  (concat "["
          (make-string 10 ?-)
          "]"))

(defun find-first-bracket-position ()
  (save-excursion
    (goto-char (point-min))
    (let ((pos (search-forward "[" nil t)))
      (when pos (1- pos)))))

(defun chunyang-emms-indicate-seek (_sec)
  (let* ((total-playing-time (emms-track-get
                              (emms-playlist-current-selected-track)
                              'info-playing-time))
         (elapsed/total (round (/ (* 100 emms-playing-time) total-playing-time))))
    (with-temp-message (format "[%-100s] %2d%%"
                               (make-string elapsed/total ?=)
                               elapsed/total)
      (sit-for 2))))

(add-hook 'emms-player-seeked-functions #'chunyang-emms-indicate-seek 'append)

;; EMMS Youtube
(add-to-list 'emms-player-list 'emms-player-mpv t)
(emms-player-set emms-player-mpd
                 'regex
                 (emms-player-simple-regexp
                  "m3u" "ogg" "flac" "mp3" "wav" "mod" "au" "aiff"))

(emms-player-set emms-player-mpv
                 'regex
                 (rx (or (: "https://" (* nonl) "youtube.com" (* nonl))
                         (+ (? (or "https://" "http://"))
                            (* nonl)
                            (regexp (eval (emms-player-simple-regexp
                                           "mp4" "mov" "wmv" "webm" "flv" "avi" "mkv")))))))

(setq my/youtube-dl-quality-list
      '("bestvideo[height<=720]+bestaudio/best[height<=720]"
        "bestvideo[height<=480]+bestaudio/best[height<=480]"
        "bestvideo[height<=1080]+bestaudio/best[height<=1080]"))

(setq my/default-emms-player-mpv-parameters
      '("--quiet" "--really-quiet" "--no-audio-display"))

(defun my/set-emms-mpd-youtube-quality (quality)
  (interactive "P")
  (unless quality
    (setq quality (completing-read "Quality: " my/youtube-dl-quality-list nil t)))
  (setq emms-player-mpv-parameters
        `(,@my/default-emms-player-mpv-parameters ,(format "--ytdl-format=%s" quality))))

(my/set-emms-mpd-youtube-quality (car my/youtube-dl-quality-list))

(defun my/emms-cleanup-urls ()
  (interactive)
  (let ((keys-to-delete '()))
    (maphash (lambda (key value)
               (when (eq (cdr (assoc 'type value)) 'url)
                 (add-to-list 'keys-to-delete key)))
             emms-cache-db)
    (dolist (key keys-to-delete)
      (remhash key emms-cache-db)))
  (setq emms-cache-dirty t))

;; EMMS get a list of all playlist files
(setq playlists "~/Playlists/")

(defun get-all-playlist-files ()
  (seq-filter
   (lambda (file)
     (string-equal
      "emms"
      (file-name--extension file)))
   (directory-files playlists)))

(defun my-popup-menu-example ()
  (interactive)
  (let ((choice (completing-read "Choose action: " '("Say Hello" "Insert Date" "Open Init"))))
    (cond
     ((string-equal choice "Say Hello")
      (message "Hello!"))
     ((string-equal choice "Insert Date")
      (insert (format-time-string "%Y-%m-%d")))
     ((string-equal choice "Open Init")
      (find-file user-init-file)))))

(defun create-functions-for-comparison (list-of-items))

;; EMMS mark mode
(setq emms-playlist-default-major-mode 'emms-mark-mode)
