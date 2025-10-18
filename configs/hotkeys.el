;;; hotkeys.el -*- lexical-binding: t; -*-

;; Hotkeys
;; Formatting hotkeys
(map! :v "SPC f r" #'+format/region)

;; Treemacs hotkeys
(map! :leader
      :desc "Open treemacs" "e" #'treemacs)

;; Magit Hotkeys
(map! :leader
      :desc "Open magit" "m" #'magit)

;; Reload config
(map! :leader
      :desc "Reload config"
      "1 1" (lambda ()
              (load-file "~/.config/doom/config.el")))

;; Set 1 window to full screen. Press f again to bring back old view
(map! :leader
      "f" #'toggle-full-screen)


(map! :leader
      :desc "Describe symbol at point" "c h" #'lsp-describe-thing-at-point)

;; Dispaly files in dired
(global-set-key (kbd "M-RET") 'dired-display-file)
(define-key dired-mode-map (kbd "M-<return>") #'dired-display-file)

;; Shows popup of scripts to run in ~/scripts folder
(global-set-key (kbd "C-c C-r") #'run-scripts)

;; Opens file in dired with default app
(local-set-key (kbd "o") #'my/dired-open-file)

;; Compiles Guile project
(map! :leader "c z" #'compile-guile)
