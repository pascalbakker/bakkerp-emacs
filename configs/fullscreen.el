;;; configs/fullscreen.el -*- lexical-binding: t; -*-

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
