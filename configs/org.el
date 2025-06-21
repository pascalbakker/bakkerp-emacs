;;; org.el -*- lexical-binding: t; -*-

(after! org
  (setq org-indent-indentation-per-level 2)
  (setq-default indent-tabs-mode nil)
  (setq org-odd-levels-only t)
  (add-hook 'org-mode-hook (lambda ()
                             (setq-local indent-tabs-mode nil)
                             (setq-local tab-width 2)
                             (setq-local standard-ident 2)
                             (setq-local org-adapt-indentation t)
                             (setq-local org-journal-carryover-items t)
                             (hotkey-next-workspace)
                             (hotkey-previous-workspace))))

;; Xwiki conversion for org mode
;;(load! "ox-xwiki.el" "~/.config/doom/lisp")

;; Macro expanders for org mode
(defun insert-org-macro ()
  (interactive)
  (insert "#+MACRO: "))

(defun insert-macro-with-values ()
  (interactive)
  (let ((macro-name (read-string "Graph-name: "))
        (macro-value (read-string "Macro value: ")))
    (insert (format ":%s:\n#+MACRO: %s %s\n:END:" macro-name macro-name macro-value))))

(with-eval-after-load 'org
  (define-key org-mode-map (kbd "C-c m") #'insert-macro-with-values))
