;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(defun load-settings (&rest files)
  "Load multiple config files from ~/.config/doom/configs/."
  (dolist (file files)
    (load (expand-file-name file "~/.config/doom/configs/"))))

(load-settings
 "general.el"                           ; general settings
 "fullscreen.el"                        ; allows full screen mode
 "center_text.el"                       ; allows buffer to center text
 "logo.el"                              ; dashboard settings
 ;; "emms.el"                              ; media player settings
 ;; "emojify.el"                           ; lazy load emojis
 "vterm.el"                             ; terminal emulator settings
 "epub.el"                              ; epub reader settings
 "org.el"                               ; org mode settings
 "lsp.el"                               ; code completion settings
 "treesitter.el"                        ; syntax highlighting settings
 "guile.el"                             ; scheme lang settings
 "dired.el"                             ; file explorer settings
 "evil.el"                              ; vim settings
 "projectile.el"                        ; project management settings
 "treemacs.el"                          ; project drawer settings
 "vertico.el"                           ; search settings
 "buffers.el"                           ; scripts for buffer management
 "scripts.el"                           ; run bash scripts functions
 "dap.el"                               ; DAP configs
 ;; "centaur.el"
 "hotkeys.el"                           ; hotkeys for all scripts and doom
 )

;; At the very top of ~/.doom.d/init.el
(defvar my-init-start-time (current-time))

;; At the very end of ~/.doom.d/config.el
(message "Doom init elapsed: %.2fs" (float-time (time-since my-init-start-time)))
