;;; vterm.el -*- lexical-binding: t; -*-
;;;
(setq vterm-timer-delay 0.01)

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

(setq vterm-shell "/bin/fish")
