;;; vterm.el -*- lexical-binding: t; -*-
;;;
(setq vterm-timer-delay 0.01)

(after! vterm
  (evil-define-key 'normal vterm-mode-map
    (kbd "M-{") #'+workspace/switch-left
    (kbd "M-}") #'+workspace/switch-right))

;; Sets (kbd "M-[0-9]") +workspace/switch-to-[0-9]
(dotimes (i 10)
  (let ((key (format "M-%d" (1+ i))) ; M-1 to M-9 and M-10 (which is M-0)
        (fn  (intern (format "+workspace/switch-to-%d" i))))
    (evil-define-key 'normal vterm-mode-map (kbd key) fn)))
