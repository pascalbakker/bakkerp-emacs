;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys

;; Banner/Splash screen
(defun satania-ascii()
  (let* ((banner '(
                   "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
                   "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⡤⠀⠀⠀⠈⠻⡿⠛⠛⠛⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿⣿⣷⣶⣦⣤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
                   "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣾⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⠀⠀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
                   "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣾⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀⠀⢀⣤⣄⣸⣷⣦⡀⠀⢻⣿⣿⣦⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
                   "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⢀⣶⣦⣀⣿⣿⠛⢿⣿⣿⣿⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
                   "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣿⣿⣿⣿⢿⣿⣦⠀⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
                   "⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠉⠓⠀⠈⠉⠃⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
                   "⠀⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠈⢻⣿⣿⣿⡄⢠⡀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
                   "⠀⠀⠀⠀⠀⠀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠉⣿⣿⣿⠁⢰⣄⠙⣿⣿⣿⠀⢿⣦⡀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
                   "⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⠘⣿⡟⠀⣸⣿⠂⠈⢻⣿⡇⢸⣿⣿⣄⠀⠈⣦⣀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
                   "⠀⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⢻⠃⠀⣿⠃⢰⣷⡄⠹⡇⠈⣿⣿⣿⣦⠀⢹⣿⣷⣄⠙⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
                   "⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⣿⣿⣿⣿⡟⠀⠀⠀⠈⠀⠀⠏⢠⣿⣿⣿⣦⠀⠈⠉⠉⠀⠀⠀⠈⠉⠻⣿⡄⢹⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
                   "⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⡿⣿⡏⠀⢻⣿⣿⣿⠁⠀⠀⠀⠀⠀⠀⣠⠿⣿⡿⠋⠀⠀⠀⠀⢀⣀⣠⣤⣤⣤⣤⣈⣡⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠹⣿⡟⠻⣿⣿⠉⠻⣿⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
                   "⠀⢰⣿⣿⣿⣿⣿⣿⣿⡿⠁⠸⠃⠀⠈⣿⣿⡇⠀⠀⠀⠀⠀⠀⡰⠃⡐⠉⠀⠀⣀⣤⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⢸⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀⠀⠀⢻⣇⠀⠀⠈⠁⠀⠀⠙⢿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
                   "⠀⣼⣿⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀⠀⠀⠘⣿⠀⠀⠀⠀⠂⠀⢠⣧⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠈⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠈⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
                   "⢠⣿⣿⣿⣿⣿⣿⣿⣿⠀⣤⠀⠀⢠⡄⠀⠁⠀⠀⠀⢰⣆⣀⣿⣿⣇⣀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣤⡖⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
                   "⢸⣿⣿⣿⣿⣿⣿⡏⠁⠀⣿⣿⡄⠀⠁⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢸⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠋⢹⣿⣿⡶⢤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
                   "⣸⣿⣿⣿⣿⣿⡟⢀⣶⣠⣿⡿⠿⠀⠀⠰⡄⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢸⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⢸⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠁⠀⠘⠛⠳⠄⠀⠀⠀⠀⠀⠀⠀"
                   "⣿⣿⣿⣿⣿⣿⠁⢸⣿⡿⠁⠀⢀⣠⣤⣤⣈⣠⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢸⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
                   "⣿⣿⣿⣿⣿⣿⡆⠈⣿⡇⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢸⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
                   "⣿⣿⣿⣿⣿⣿⡇⠀⠘⣷⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⡟⠉⠉⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢸⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⣄⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
                   "⣿⣿⣿⣿⣿⣿⡇⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠉⠙⠛⠛⠛⠋⠉⠁⠀⠀⠀⠀⠀⠙⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⢸⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣷⣆⣰⣿⡷⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀"
                   "⣿⣿⣿⣿⣿⣿⠃⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⠿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢻⣿⣿⣿⣿⣿⣿⣿⡇⢸⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⠀⠀⠀⠀⠈⢻⡿⠋⣠⣤⠈⣧⡀⠀⠀⠀⠀⠀⠀⠀"
                   "⣿⣿⣿⣿⣿⣿⠀⠀⣸⣿⣿⣿⣿⣿⣿⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣿⣿⣿⣿⡇⣼⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣿⡏⠀⠀⠀⠀⠀⣀⣠⣾⣿⣿⣆⠘⣿⣦⡀⠀⠀⠀⠀⠀"
                   "⢻⣿⣿⣿⣿⣿⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⢀⣠⡀⢿⣿⣿⣿⣿⣿⠀⣿⠟⢿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⡿⠁⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⠂⣿⣿⣷⡄⠀⠀⠀⠀"
                   "⠈⢸⣿⣿⣿⣿⠀⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠴⠛⣉⣉⣠⣴⣿⣿⣷⠘⣿⣿⣿⣿⡟⢀⠏⠀⢸⣿⣿⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⡿⠁⠀⣀⣴⣾⣿⣿⣿⣿⣿⣿⣿⠏⣰⣿⣿⣿⣿⡆⠀⠀⠀"
                   "⠸⣿⣿⠿⣿⣿⠀⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⢀⡔⢁⣴⣾⣿⣿⣿⣿⣿⣿⣿⡆⢹⣿⣿⣿⡇⠈⣠⡇⢸⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⠁⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⣰⣿⣿⠟⢉⡉⢻⡀⠀⠀"
                   "⠀⣿⣫⠀⢿⣿⠀⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠈⢠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⢸⣿⣿⣿⠀⣰⣿⡇⢸⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⠃⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃⠀⠿⠟⢁⣴⣿⠇⢸⣿⡀⠀"
                   "⠀⢹⣿⠀⢸⣿⡄⠀⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⢸⣿⣿⣷⣾⣿⣿⠃⠘⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⠃⣼⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠀⢀⣠⣴⣾⣿⣿⠏⢠⣿⣿⡧⠀"
                   "⠀⠘⣿⠀⠀⢿⡇⠀⠀⠀⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢸⣿⣿⣿⣿⣿⣿⠀⡆⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⠃⣼⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⢀⣾⣿⣿⣿⣿⠛⢁⣴⣿⣿⣿⣷⡄"
                   "⠀⠀⢻⡀⠀⠈⢿⠀⠀⠀⠀⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡄⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⣿⣿⣿⣿⣿⣿⣿⠀⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⠃⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣠⣶⣿⠿⠿⢿⠟⠁⣴⣿⣿⣿⣿⣿⣿⡇"
                   "⠀⠀⠘⡇⠀⠀⠈⢇⠀⠀⠀⠀⠀⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣌⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⠟⢁⣼⣿⣿⣿⣿⣿⣿⡇⢰⣿⣿⠃⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⠏⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢋⣠⣶⡇⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⡟"
                   "⠀⠀⠀⠐⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣄⡙⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣤⣉⠛⠛⠛⠛⢛⣉⣤⣾⣿⣿⣿⣿⣿⣿⡿⠟⠃⣼⣿⠃⢀⣼⡆⠀⠀⢠⣾⣿⣿⣿⠏⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⢠⣾⣿⡿⠀⠀⠀⠀⢹⣿⣿⣿⣿⣿⣿⣿"
                   "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣶⣄⡉⠛⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠟⢋⣡⣴⡶⠀⠟⢁⣴⣿⣿⡇⠀⣰⣿⣿⣿⣿⡟⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢀⣾⣿⣿⠁⠀⠀⠀⠀⠈⣿⣿⣿⣿⣿⣿⠋"
                   "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⣿⣿⡇⠀⠀⠉⠙⠻⠿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⢋⣉⣤⣶⣿⣿⣿⣿⠃⠀⣠⣾⣿⣿⣿⠃⣰⣿⣿⣿⣿⣿⢁⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⣼⣿⣿⠇⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⠟⠁⠀"
                   "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠉⠛⠛⠛⠛⣉⣠⣴⣾⣿⣿⣿⣿⣿⣿⣿⣧⣴⣿⣿⣿⣿⣿⠏⢠⣿⣿⣿⣿⣿⡇⣸⣿⣿⣿⣿⣿⣿⣿⣿⡿⠛⣁⣾⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⢿⠿⠛⠁⠀⠀ "
                   ))
         (longest-line (apply #'max (mapcar #'length banner))))
    (put-text-property
     (point)
     (dolist (line banner (point))
       (insert (+doom-dashboard--center
                +doom-dashboard--width
                (concat line (make-string (max 0 (- longest-line (length line))) 32)))
               "\n"))
     'face 'doom-dashboard-banner)))

(setq +doom-dashboard-ascii-banner-fn #'satania-ascii)

;; General settings

(setq display-line-numbers-type t)

(setq org-directory "~/org/")

(setq doom-theme 'doom-one)

(setq doom-font (font-spec :family "Iosevka" :weight 'regular :size 14))

(setq display-line-numbers-type t)

(setq org-directory "~/org/")

;; pixel scrolling
(pixel-scroll-precision-mode t)

;; abbr
(setq-default abbrev-mode t)

;; Garbage collection threshold
(setq gc-cons-threshold (* 100 1024 1024))

;; Centaur tabs
(define-key evil-normal-state-map (kbd "g t") 'centaur-tabs-forward)
(define-key evil-normal-state-map (kbd "g T") 'centaur-tabs-backward)

;; Html config
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

;; Mail setup
(load "~/.config/doom/lisp/email.el")

;; Improves performance if only using gmail
(setq mu4e-index-cleanup nil
      mu4e-index-lazy-check t)

;; Send mail
;; add to $DOOMDIR/config.el
(after! mu4e
  (setq sendmail-program (executable-find "msmtp")
	send-mail-function #'smtpmail-send-it
	message-sendmail-f-is-evil t
	message-sendmail-extra-arguments '("--read-envelope-from")
	message-send-mail-function #'message-send-mail-with-sendmail))

;; Epub
(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))
(setq nov-text-width 100)  ;; Set text width to 100 characters (adjust as needed)
(setq visual-fill-column-center-text t)  ;; Enable centering of text

(add-hook 'nov-mode-hook
          (lambda ()
            (visual-line-mode 1)  ;; Enable visual line mode for wrapping text
            (visual-fill-column-mode 1)))  ;; Enable visual-fill-column mode to center text

(defun center-text ()
  "Center the text in the middle of the buffer. Works best in full screen."
  (interactive)
  (set-window-margins
   (car (get-buffer-window-list (current-buffer) nil t))
   (/ (window-width) 4)
   (/ (window-width) 4)))

(defun center-text-clear ()
  "Clear the centering of the text."
  (interactive)
  (set-window-margins
   (car (get-buffer-window-list (current-buffer) nil t))
   nil
   nil))

(setq centered nil)

(defun center-text-mode ()
  "Toggle centering of text in the buffer."
  (interactive)
  (if centered
      (progn
        (center-text-clear)
        (setq centered nil))
    (progn
      (center-text)
      (setq centered t))))

(define-key global-map (kbd "C-c M-t") 'center-text-mode)


;; Popup
(after! dired
  (set-popup-rule! "^\\*Dired"
    :side 'center
    :size 0.6
    :vslot 2
    :select t
    :quit t))

;; Mermaid
;; For MacOS
;; (setq ob-mermaid-cli-path "/opt/homebrew/bin/mmdc")
;; (after! org
;; (require 'ob-mermaid)
;; (setq org-babel-mermaid-command "mmdc"))

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

;; Org Configuration
(after! org
  (setq org-indent-indentation-per-level 2)
  (setq-default indent-tabs-mode nil)
  (setq org-odd-levels-only t)
  (add-hook 'org-mode-hook (lambda ()
                             (setq-local indent-tabs-mode nil)
                             (setq-local tab-width 2)
                             (setq-local standard-ident 2)
                             (setq-local org-adapt-indentation t)
                             (setq-local org-journal-carryover-items t)
                             (hotkey-next-workspace)
                             (hotkey-previous-workspace))))

;; Xwiki conversion for org mode
;;(load! "ox-xwiki.el" "~/.config/doom/lisp")

;; Macro expanders for org mode
(defun insert-org-macro ()
  (interactive)
  (insert "#+MACRO: "))

(defun insert-macro-with-values ()
  (interactive)
  (let ((macro-name (read-string "Graph-name: "))
        (macro-value (read-string "Macro value: ")))
    (insert (format ":%s:\n#+MACRO: %s %s\n:END:" macro-name macro-name macro-value))))

(with-eval-after-load 'org
  (define-key org-mode-map (kbd "C-c m") #'insert-macro-with-values))

;; Projectile hotkeys
(after! projectile
  (add-to-list 'projectile-project-root-files "Config"))


;; LSP settings

;; Set time until completion displays in seconds
(setq lsp-idle-delay 0.1)

;; Java LSP configurations

;; Turn off format on save for java
(setq +format-on-save-enabled-modes
      '(not java-mode))

;; Set formatter location and formatter settings
[(after! lsp-java
   :config
   (setq lsp-java-format-settings-url "file:///Users/USERNAME/Projects.xml"
         lsp-java-format-settings-profile "DefaultProfile"
         lsp-java-completion-import-order ["" "javax" "java" "#"]))
 ]

;; Helm

;; Show input above search
(setq helm-echo-input-in-header-line t)

;; Have tilde expand
(setq helm-ff-tilde-expansion t)

;; vterm settings
(setq vterm-timer-delay 0.01)

;; treemacs settings

;; allow 1 click for tree
(define-key treemacs-mode-map [mouse-1] #'treemacs-single-click-expand-action)

;; Allow drag changing width of treemacs
(setq treemacs--width-is-locked nil)

;; Vertico posframe
(load "~/.config/doom/lisp/vertico-posframe.el")
(vertico-posframe-mode 1)

;; Consult live preview
(setq consult-preview-enable t)
(setq vertico-posframe-height 50)
