;;; configs/guile.el -*- lexical-binding: t; -*-

(defun compile-guile ()
  (interactive)
  (let ((buffer-name buffer-file-name))
    ;;(split-window-below )
    (async-shell-command
     (format "guile %s" (shell-quote-argument buffer-file-name))
     "*Guile Output*")))

(defun kill-guile ()
  (interactive)
  (kill-buffer "*Guile Output*"))

;; Guile compile
(defun my-set-guile-compile-command ()
  "Set `compile-command` to run Guile on the current buffer file."
  (when (and buffer-file-name
             (string-match-p "\\.scm\\'" buffer-file-name))
    (set (make-local-variable 'compile-command)
         (format "guile %s" (shell-quote-argument buffer-file-name)))))

;; Set scheme to csi
(setq scheme-program-name "csi")
