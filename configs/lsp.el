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

(setq dap-cpptools-extension-version "1.5.1")

(with-eval-after-load 'lsp-rust
  (require 'dap-cpptools))

(with-eval-after-load 'dap-cpptools
  ;; Add a template specific for debugging Rust programs.
  ;; It is used for new projects, where I can M-x dap-edit-debug-template
  (dap-register-debug-template "Rust::CppTools Run Configuration"
                               (list :type "cppdbg"
                                     :request "launch"
                                     :name "Rust::Run"
                                     :MIMode "gdb"
                                     :miDebuggerPath "rust-gdb"
                                     :environment []
                                     :program "${workspaceFolder}/target/debug/hello / replace with binary"
                                     :cwd "${workspaceFolder}"
                                     :console "external"
                                     :dap-compilation "cargo build"
                                     :dap-compilation-dir "${workspaceFolder}")))

(with-eval-after-load 'dap-mode
  (setq dap-default-terminal-kind "integrated") ;; Make sure that terminal programs open a term for I/O in an Emacs buffer
  (dap-auto-configure-mode +1))
