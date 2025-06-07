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
(load "~/.config/doom/configs/logo.el")
(load "~/.config/doom/configs/emms.el")
(load "~/.config/doom/configs/email.el")
(load "~/.config/doom/configs/mail.el")
(load "~/.config/doom/configs/hotkeys.el")
(load "~/.config/doom/configs/vterm.el")
(load "~/.config/doom/configs/epub.el")
(load "~/.config/doom/configs/org.el")
(load "~/.config/doom/configs/lsp.el")

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

(defun center-text ()
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
     "*Guile Output*")
    )
  )

(map! :leader "c z" #'compile-guile)

(defun kill-guile ()
  (interactive)
  (kill-buffer "*Guile Output*")
  )
