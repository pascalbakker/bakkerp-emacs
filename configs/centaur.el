;;; configs/centaur.el -*- lexical-binding: t; -*-

(after! centaur-tabs
  ;; Add a hook to disable centaur-tabs for lsp-ui-doc buffers
  (add-to-list 'centaur-tabs-hide-tabs-hooks #'lsp-ui-doc-mode)
  
  ;; Optional: hide tabs for other popup buffers
  (dolist (mode '(dap-ui-repl-mode helpful-mode compilation-mode))
    (add-to-list 'centaur-tabs-hide-tabs-hooks mode)))

(after! centaur-tabs
  ;; Disable Centaur Tabs for any buffer in a child frame
  (advice-add
   'centaur-tabs-buffer-tabs
   :around
   (lambda (orig-func &rest args)
     (seq-filter
      (lambda (buf)
        (let ((frame (window-frame (get-buffer-window buf t))))
          ;; Only show buffers in normal frames, not child frames
          (not (frame-parameter frame 'parent-frame))))
      (apply orig-func args)))))
