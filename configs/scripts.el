;;; configs/scripts.el -*- lexical-binding: t; -*-

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

(defun get-lists-of-scripts ()
  (directory-files "~/scripts/" nil directory-files-no-dot-files-regexp))

(defun run-scripts ()
  "Creates a menu of different scripts to execute"
  (interactive)
  let ((choice (completing-read "Choose script: " (get-lists-of-scripts)))
       (async-shell-command (format "sudo sh ~/scripts/%s" choice) "*Shell Output*")))

(defun my-set-compile-command-for-sh ()
  "Set compile command to `bash FILE_NAME.sh` if buffer is a shell script."
  (when (and buffer-file-name
             (string= (file-name-extension buffer-file-name) "sh"))
    (set (make-local-variable 'compile-command)
         (format "bash %s" (shell-quote-argument buffer-file-name)))))

(add-hook 'sh-mode-hook 'my-set-compile-command-for-sh)
