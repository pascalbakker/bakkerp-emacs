;;; configs/dap.el -*- lexical-binding: t; -*-

;; Require dap-ui early and enable it once
(require 'dap-ui)
(dap-ui-mode 1)

;; Enable dap auto-configure features for full UI integration
(setq dap-auto-configure-features '(sessions locals tooltip))
(dap-auto-configure-mode +1)

;; Enable dap debug logging (optional, useful for troubleshooting)
(setq dap-print-io t)

;; Load cpptools debugger integration
(require 'dap-cpptools)
(setq dap-cpptools-extension-version "1.5.1")

;; Register Rust debug template for cpptools
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
                                     :program "${workspaceFolder}/target/debug/kvmapi"
                                     :cwd "${workspaceFolder}"
                                     :console "external"
                                     :dap-compilation "cargo build"
                                     :dap-compilation-dir "${workspaceFolder}")))

(setq dap-auto-configure-features (remove 'controls dap-auto-configure-features))


(map! :map dap-mode-map
      :leader
      (:prefix ("d" . "dap")
       :desc "debug"             "d" #'dap-debug
       :desc "debug last"        "l" #'dap-debug-last
       :desc "debug recent"      "r" #'dap-debug-recent
       :desc "continue"          "c" #'dap-continue
       :desc "next"              "n" #'dap-next
       :desc "step in"           "i" #'dap-step-in
       :desc "step out"          "o" #'dap-step-out
       :desc "hydra"             "h" #'dap-hydra
       :desc "restart"           "R" #'dap-debug-restart
       :desc "eval"              "e" #'dap-eval
       :desc "eval region"       "E" #'dap-eval-region
       :desc "eval at point"     "s" #'dap-eval-thing-at-point
       :desc "add expr"          "a" #'dap-ui-expressions-add
       :desc "remove expr"       "x" #'dap-ui-expressions-remove
       :desc "toggle breakpoint" "b" #'dap-breakpoint-toggle
       :desc "bp condition"      "B" #'dap-breakpoint-condition))




(custom-set-faces
 '(dap-breakpoint-fringe-face ((t (:foreground "red" :weight bold)))))


