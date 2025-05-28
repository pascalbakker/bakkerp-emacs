;;; lsp.el -*- lexical-binding: t; -*-

(after! lsp-mode
  (setq
   ;; Html Format
   lsp-html-auto-closing-tags t
   lsp-html-format-enable t
   lsp-html-format-wrap-line-length 100))

;; Dap setup
(require 'dap-cpptools)

;; Dap modes
(dap-register-debug-template
 "cpptools::Run Configuration"
 (list :type "cppdbg"
       :request "launch"
       :name "cpptools::Run Configuration"
       :MIMode "gdb"
       :program "${workspaceFolder}/build/sc2d_client/sc2d_client"
       :cwd "${workspaceFolder}/build/"))

(dap-register-debug-template
 "Rust LLDB Debug Configuration"
 (list :type "cppdbg"
       :request "launch"
       :name "Rust::Run"
       :MIMode "lldb"
       :gdbpath "rust-lldb"
       :program (concat (projectile-project-root) "target/debug/" (projectile-project-name))
       :environment []
       :cwd (projectile-project-root)))

;; Set time until completion displays in seconds
(setq lsp-idle-delay 0.1)

;; Turn off format on save for java
(setq +format-on-save-enabled-modes
      '(not java-mode))

;; Set formatter location and formatter settings
[(after! lsp-java
   :config
   (setq lsp-java-format-settings-url "file:///Users/USERNAME/Projects.xml"
         lsp-java-format-settings-profile "DefaultProfile"
         lsp-java-completion-import-order ["" "javax" "java" "#"]))]

;; Godot
(use-package! gdscript-mode
  :mode "\\.gd\\'"
  :hook (gdscript-mode . eglot-ensure))
