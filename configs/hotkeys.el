;;; hotkeys.el -*- lexical-binding: t; -*-

;; Hotkeys
;; Workspace
(defun hotkey-next-workspace ()
  (global-set-key (kbd "M-}") '+workspace:switch-next))

(defun hotkey-previous-workspace ()
  (global-set-key (kbd "M-{") '+workspace:switch-previous))

(hotkey-next-workspace)
(hotkey-previous-workspace)

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

(map! :leader
      "f" #'toggle-full-screen)
