;;; configs/dired.el -*- lexical-binding: t; -*-

(defun dired-unrar-into-folder ()
  "Extract selected .rar file into a folder named after it."
  (interactive)
  (let* ((file (dired-get-file-for-visit))
         (basename (file-name-sans-extension (file-name-nondirectory file)))
         (target-dir (expand-file-name basename (file-name-directory file)))
         (cmd (format "mkdir -p \"%s\" && unrar x \"%s\" \"%s/\"" target-dir file target-dir)))
    (async-shell-command cmd)))

(defun dired-open-in-feh ()
  "Opens selected file in feh"
  (interactive)
  (let ((file (dired-get-file-for-visit)))
    (async-shell-command (format "feh -Z %s" file))))

(setq dired-mouse-drag-files t)

;;  Dired RET custom
(defun my/dired-open-file ()
  "Custom open action for files in Dired based on file extension."
  (interactive)
  (let* ((file (dired-get-file-for-visit))
         (ext (file-name-extension file t))) ; include the dot
    (cond
     ;; Open video/audio files with mpv
     ((member ext '(".mp4" ".mkv" ".webm" ".mp3" ".wav" ".flac"))
      (start-process "mpv" nil "mpv" file))

     ;; Open images with feh
     ((member ext '(".jpg" ".jpeg" ".png" ".gif"))
      (start-process "feh" nil "feh" file))

     ;; Open PDFs with zathura
     ((string= ext ".pdf")
      (start-process "zathura" nil "zathura" file))

     ;; Default: open in Emacs
     (t (find-file file)))))

;; Replace RET behavior in Dired
(add-hook 'dired-mode-hook
          (lambda ()))
