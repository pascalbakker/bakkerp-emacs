;;; configs/buffers.el -*- lexical-binding: t; -*-

(defun kill-all-image-buffers ()
  "Kill all buffers in `image-mode`."
  (interactive)
  (dolist (buf (buffer-list))
    (with-current-buffer buf
      (when (eq major-mode 'image-mode)
        (kill-buffer buf)))))

(defun kill-all-epub-buffers ()
  "Kill all buffers in `image-mode`."
  (interactive)
  (dolist (buf (buffer-list))
    (with-current-buffer buf
      (when (eq major-mode 'nov-mode)
        (kill-buffer buf)))))
