;;; configs/center_text.el -*- lexical-binding: t; -*-

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
