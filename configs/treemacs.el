;;; configs/treemacs.el -*- lexical-binding: t; -*-

;; treemacs settings
;; allow 1 click for tree
(with-eval-after-load 'treemacs
  (define-key treemacs-mode-map [mouse-1] #'treemacs-single-click-expand-action))
