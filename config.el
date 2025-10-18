;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys

;; Load other configs
;; (load "~/.config/doom/configs/logo.el")
(load "~/.config/doom/configs/emms.el")
;;(load "~/.config/doom/configs/email.el")
(load "~/.config/doom/configs/mail.el")
(load "~/.config/doom/configs/hotkeys.el")
(load "~/.config/doom/configs/vterm.el")
(load "~/.config/doom/configs/epub.el")
(load "~/.config/doom/configs/org.el")
(load "~/.config/doom/configs/lsp.el")
(load "~/.config/doom/configs/treesitter.el")

;;(when (package-installed-p 'evil)
;;  (load "~/.config/doom/configs/evil.el"))

;; General settings

(setq display-line-numbers-type t)

(setq org-directory "~/org/")

(setq doom-theme 'doom-one)

(setq doom-font (font-spec :family "Iosevka" :weight 'regular :size 14))

(setq display-line-numbers-type t)

;; pixel scrolling
(pixel-scroll-precision-mode t)

;; Allow drag changing width of treemacs
(setq treemacs--width-is-locked nil)

;; abbr
(setq-default abbrev-mode t)

;; Garbage collection threshold
(setq gc-cons-threshold (* 100 1024 1024))

(defun center-text ():
       "Center the text in the middle of the buffer. Works best in full screen."
       (interactive)
       (set-window-margins
        (car (get-buffer-window-list (current-buffer) nil t))
        (/ (window-width) 4)
        (/ (window-width) 4)))

(defun center-text-clear ()
  "Clear the centering of the text."
  (interactive)
  (set-window-margins
   (car (get-buffer-window-list (current-buffer) nil t))
   nil
   nil))

;; Mermaid
;; For MacOS
;; (setq ob-mermaid-cli-path "/opt/homebrew/bin/mmdc")
;; (after! org
;; (require 'ob-mermaid)
;; (setq org-babel-mermaid-command "mmdc"))


;; treemacs settings
;; allow 1 click for tree
(define-key treemacs-mode-map [mouse-1] #'treemacs-single-click-expand-action)

;; Vertico popup frame
(vertico-posframe-mode 1)
(setq vertico-count 50)

;; Set vertico fringes
(setq vertico-posframe-parameters
      '((left-fringe . 20)
        (right-fringe . 8)))

;; Consult live preview
(setq consult-preview-enable t)

;; Winner mode
(setq winner-mode 1)

(defvar fullscreen-mode nil
  "Toggle fullscreen mode")

(defun toggle-full-screen ()
  (interactive)
  (if fullscreen-mode
      (progn
        (setq fullscreen-mode nil)
        (winner-undo))
    (progn
      (setq fullscreen-mode t)
      (delete-other-windows))))

;; Projectile
(after! projectile
  (add-to-list 'projectile-project-root-files "Config"))

(setq projectile-project-search-path '("~/projects/" "~/dev/" "~/code/"))

;; Set scheme to csi
(setq scheme-program-name "csi")

;; Adds script header
(defun is-new-file-and-matches-extension (extension)
  (and (buffer-file-name)
       (string-match-p (format "\\.%s\\'" extension) (buffer-file-name))
       (not (file-exists-p (buffer-file-name)))
       (= (point-min) (point-max))))

(defun map-script-header-to-text ()
  (cond
   ((is-new-file-and-matches-extension "scm")
    (insert "#!/usr/local/bin/csi -s\n"))
   ((is-new-file-and-matches-extension "el")
    (insert ";;;%s" (file-name)))))

(add-hook 'find-file-hook #'map-script-header-to-text)

;; Guile compile
(defun my-set-guile-compile-command ()
  "Set `compile-command` to run Guile on the current buffer file."
  (when (and buffer-file-name
             (string-match-p "\\.scm\\'" buffer-file-name))
    (set (make-local-variable 'compile-command)
         (format "guile %s" (shell-quote-argument buffer-file-name)))))

;;(add-hook 'scheme-mode-hook #'my-set-guile-compile-command)

(defun compile-guile ()
  (interactive)
  (let ((buffer-name buffer-file-name))
    ;;(split-window-below )
    (async-shell-command
     (format "guile %s" (shell-quote-argument buffer-file-name))
     "*Guile Output*")))

(map! :leader "c z" #'compile-guile)

(defun kill-guile ()
  (interactive)
  (kill-buffer "*Guile Output*"))

(defun copy-lines (n)
  "Copies n number of lines past cursor including current line"
  (interactive "p")
  (beginning-of-line)
  (set-mark (point))
  (dotimes (_ n)
    (forward-line))
  (end-of-line 1)
  (kill-ring-save (mark) (point)))

(global-set-key (kbd "C-c y y") 'copy-lines)

;; Sets (kbd "M-[0-9]") +workspace/switch-to-[0-9]
;; (dotimes (i 10)
;;   (let ((key (format "C-c %d" i))
;;         (fn  (intern (format "+workspace/switch-to-%d" i))))
;;     (global-set-key (kbd key) fn)))

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

(defun kill-all-image-buffers ()
  "Kill all buffers in `image-mode`."
  (interactive)
  (dolist (buf (buffer-list))
    (with-current-buffer buf
      (when (eq major-mode 'image-mode)
        (kill-buffer buf)))))

(defun kill-all-epub-buffers ()
  "Kill all buffers in `image-mode`."
  (interactive)
  (dolist (buf (buffer-list))
    (with-current-buffer buf
      (when (eq major-mode 'nov-mode)
        (kill-buffer buf)))))

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

(local-set-key (kbd "o") #'my/dired-open-file)

(defun get-lists-of-scripts ()
  (directory-files "~/scripts/" nil directory-files-no-dot-files-regexp))

(defun run-scripts ()
  "Creates a menu of different scripts to execute"
  (interactive)
  let ((choice (completing-read "Choose script: " (get-lists-of-scripts)))
       (async-shell-command (format "sudo sh ~/scripts/%s" choice) "*Shell Output*")))

(global-set-key (kbd "C-c C-r") #'run-scripts)

(defun my-set-compile-command-for-sh ()
  "Set compile command to `bash FILE_NAME.sh` if buffer is a shell script."
  (when (and buffer-file-name
             (string= (file-name-extension buffer-file-name) "sh"))
    (set (make-local-variable 'compile-command)
         (format "bash %s" (shell-quote-argument buffer-file-name)))))

(add-hook 'sh-mode-hook 'my-set-compile-command-for-sh)

(global-set-key (kbd "M-RET") 'dired-display-file)
(define-key dired-mode-map (kbd "M-<return>") #'dired-display-file)

(after! lsp-ui
  (setq lsp-ui-doc-enable t
        lsp-ui-doc-show-with-cursor t
        lsp-ui-doc-show-with-mouse t))

(map! :leader
      :desc "Describe symbol at point" "c h" #'lsp-describe-thing-at-point)

(with-eval-after-load 'vterm
  (define-key vterm-mode-map [mouse-2] #'vterm-yank))

(defun my/vterm-paste ()
  "Paste clipboard content into vterm using bracketed paste."
  (interactive)
  (let ((clip (current-kill 0))) ;; get system clipboard
    ;; bracketed paste start
    (vterm-send-string "\e[200~")
    (vterm-send-string clip)
    ;; bracketed paste end
    (vterm-send-string "\e[201~")))

(with-eval-after-load 'vterm
  (define-key vterm-mode-map (kbd "C-S-v") #'my/vterm-paste))
