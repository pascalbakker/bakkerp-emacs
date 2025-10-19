;;; lsp.el -*- lexical-binding: t; -*-

(after! lsp-mode
  (setq
   ;; Html Format
   lsp-html-auto-closing-tags t
   lsp-html-format-enable t
   lsp-html-format-wrap-line-length 100))

;; Set time until completion displays in seconds
(setq lsp-idle-delay 0.1)

;; Start showing completion after typing 1 or 2 characters
(setq company-minimum-prefix-length 1)
(setq lsp-completion-provider :capf) ;; ensure using company-capf integration

;; Turn off format on save for java
(setq +format-on-save-enabled-modes
      '(not java-mode))

;; Set formatter location and formatter settings
[(after! lsp-java
   :config
   (setq lsp-java-format-settings-url "file:///Users/USERNAME/Projects.xml"
         lsp-java-format-settings-profile "DefaultProfile"
         lsp-java-completion-import-order ["" "javax" "java" "#"]))]

(after! lsp-ui
  (setq lsp-ui-doc-enable t
        lsp-ui-doc-show-with-cursor t
        lsp-ui-doc-show-with-mouse t
        lsp-ui-doc-border nil
        lsp-ui-doc-max-width 120
        lsp-ui-doc-max-height 30
        lsp-ui-doc-position 'at-point
        lsp-ui-doc-frame-parameters
        '((undecorated . t)                ;; no titlebar
          (no-other-frame . t)
          (line-spacing . 1)
          (left-fringe . 0)
          (right-fringe . 0)
          (top-fringe . 0)
          (bottom-fringe . 0)
          (header-line-format . nil)            ;; <-- remove header line
          (background-color . "#1e1e2e"))
        ))


(after! centaur-tabs
  ;; Hide tabs for popup modes like lsp-ui-doc
  (add-to-list 'centaur-tabs-hide-tabs-hooks #'lsp-ui-doc-mode)
  (add-to-list 'centaur-tabs-hide-tabs-hooks #'dap-ui-repl-mode)
  (add-to-list 'centaur-tabs-hide-tabs-hooks #'helpful-mode)
  (add-to-list 'centaur-tabs-hide-tabs-hooks #'compilation-mode))
