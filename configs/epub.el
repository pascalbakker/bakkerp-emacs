;;; epub.el -*- lexical-binding: t; -*-

;; Epub Nav.el
(setq nov-continuous-scroll t)
(setq nov-unzip-program (executable-find "bsdtar")
      nov-unzip-args '("-xC" directory "-f" filename))
(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))

(defun my/nov-reader-mode ()
  "Minimal reader-mode for nov.el with centered text and Alegreya font."
  (face-remap-add-relative 'default :family "Alegreya" :height 180)
  ;; Add line spacing for readability
  (setq-local line-spacing 0.2))

(add-hook 'nov-mode-hook 'my/nov-reader-mode)
