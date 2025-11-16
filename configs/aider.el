;;; configs/aider.el -*- lexical-binding: t; -*-

(load "~/.config/doom/data/llm_keys.el" t)

(use-package! aider
  :config
  ;; Use latest Claude Sonnet model
  (setq aider-args '("--model" "sonnet" "--no-auto-accept-architect"))

  ;; Set environment variable
  (setenv "ANTHROPIC_API_KEY" anthropic-api-key)

  ;; Keybinding for transient menu
  (map! "C-c a" #'aider-transient-menu)

  ;; Add Aider Magit actions into Magit menu
  (aider-magit-setup-transients)

  ;; Auto-revert config
  (global-auto-revert-mode 1)
  (auto-revert-mode 1))
