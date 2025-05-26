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

;; Center text modes
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

;; Popup
;; Centered floating window

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

;; vterm settings
(setq vterm-timer-delay 0.01)

;; treemacs settings

;; allow 1 click for tree
(define-key treemacs-mode-map [mouse-1] #'treemacs-single-click-expand-action)

;; Allow drag changing width of treemacs
(setq treemacs--width-is-locked nil)

;; Vertico popup frame
(vertico-posframe-mode 1)
(setq vertico-count 50)

;; Set vertico fringes
(setq vertico-posframe-parameters
      '((left-fringe . 20)
        (right-fringe . 8)))

;; Consult live preview
(setq consult-preview-enable t)

;; Winner mode
(setq winner-mode 1)

(defvar fullscreen-mode nil
  "Toggle fullscreen mode")

(defun toggle-full-screen ()
  (interactive)
  (if fullscreen-mode
      (progn
        (setq fullscreen-mode nil)
        (winner-undo))
    (progn
      (setq fullscreen-mode t)
      (delete-other-windows))))

(map! :leader
      "f" #'toggle-full-screen)

;; Epub Nav.el
(setq nov-continuous-scroll t)
(setq nov-unzip-program (executable-find "bsdtar")
      nov-unzip-args '("-xC" directory "-f" filename))
(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))

(defun my/nov-reader-mode ()
  "Minimal reader-mode for nov.el with centered text and Alegreya font."
  (face-remap-add-relative 'default :family "Alegreya" :height 180)
  ;; Add line spacing for readability
  (setq-local line-spacing 0.2))

(add-hook 'nov-mode-hook 'my/nov-reader-mode)

;; Vterm mapping
(after! vterm
  (evil-define-key 'normal vterm-mode-map
    (kbd "M-{") #'+workspace/switch-left
    (kbd "M-}") #'+workspace/switch-right))

;; Sets (kbd "M-[0-9]") +workspace/switch-to-[0-9]
(dotimes (i 10)
  (let ((key (format "M-%d" (1+ i))) ; M-1 to M-9 and M-10 (which is M-0)
        (fn  (intern (format "+workspace/switch-to-%d" i))))
    (evil-define-key 'normal vterm-mode-map (kbd key) fn)))

;; Godot
(use-package! gdscript-mode
  :mode "\\.gd\\'"
  :hook (gdscript-mode . eglot-ensure))

;; Projectile
(setq projectile-project-search-path '("~/projects/" "~/dev/" "~/code/"))

;; Emms
;;(setq emms-browser-covers #'emms-browser-cache-thumbnail-async)
;;(setq emms-browser-thumbnail-small-size 64)
;;(setq emms-browser-thumbnail-medium-size 128)
(use-package emms
  :config
  (require 'emms-setup)
  (require 'emms-mpris)
  (emms-all)
  (emms-default-players)
  (emms-mpris-enable)
  :custom
  (emms-browser-covers #'emms-browser-cache-thumbnail-async)
  :bind
  (("C-c w m b" . emms-browser)
   ("C-c w m e" . emms)
   ("C-c w m p" . emms-play-playlist )
   ("<XF86AudioPrev>" . emms-previous)
   ("<XF86AudioNext>" . emms-next)
   ("<XF86AudioPlay>" . emms-pause)))

(map! :leader
      :desc "EMMS Browse by Title"
      "s t" #'emms-browser-search-by-title)

;; Persist music across sessions
(require 'emms-history)

;; EMMS layout
(defun my/emms-custom ()
  "Set up EMMS layout with:
- EMMS playlist on top-left
- *EMMS Overview* on bottom-left
- emms-browser on the right"
  (interactive)
  ;; Start clean
  (delete-other-windows)

  ;; Left: split into top (playlist) and bottom (overview)
  (let* ((left (selected-window))
         (right (split-window left nil 'right))
         (overview (split-window left 'below))
         (controls (split-window left  5 'below))) ; bottom-left small

    ;; Left top: Playlist
    (with-selected-window left
      (emms))  ;; opens the EMMS playlist buffer

    ;; Left bottom: *EMMS Overview*
    (with-selected-window overview
      (switch-to-buffer "*EMMS Overview*")
      (unless (get-buffer "*EMMS Overview*")
        (with-current-buffer (get-buffer-create "*EMMS Overview*")
          (insert "EMMS Overview goes here.\n"))))

    ;; set controls
    (with-selected-window controls
      (switch-to-buffer "*EMMS Controls*")
      (create-controls)
      )

    ;; Right: EMMS Browser
    (with-selected-window right
      (emms-browser))))


;; Emms show album art at top

;; EMMS new line hook
(defun my-emms-ensure-newline-at-top ()
  "Ensure `*EMMS Playlist*` buffer always has a blank line at the top."
  (when (string= (buffer-name) "*EMMS Playlist*")
    (save-excursion
      (goto-char (point-min))
      ;; If first line is not empty, insert a newline at top
      (unless (looking-at-p "^$")
        (insert "\n")))))

;; Add to playlist mode hook so it runs whenever playlist buffer loads
(add-hook 'emms-playlist-mode-hook #'my-emms-ensure-newline-at-top)

;; Optional: run on buffer display, just in case
(add-hook 'window-configuration-change-hook
          (lambda ()
            (when-let ((buf (get-buffer "*EMMS Playlist*")))
              (with-current-buffer buf
                (my-emms-ensure-newline-at-top)))))

;; Update on song change
(add-hook 'emms-playlist-selection-changed-hook
          (lambda ()
            (read-only-mode 0)
            (display-cover-art)
            (read-only-mode 1)))

(defun create-controls ()
  (interactive)
  (with-current-buffer "*EMMS Controls*"
    ;; Buttons for pause play seek
    (let ((inhibit-read-only t)
          (inhibit-modification-hooks t)
          (inhibit-point-motion-hooks t)
          (inhibit-modification-hooks t)
          (inhibit-redisplay t))
      (erase-buffer)
      (setq mode-line-format nil)
      (insert-button " ⏸ "
                     'action (lambda (_) (emms-pause))
                     'follow-link t
                     'face '(:box t :background "gray20" :foreground "white" :weight bold :height 2.0))
      (insert "  ")
      (insert-button " ⏪ "
                     'action (lambda (_) (emms-seek-to -10))
                     'follow-link t
                     'face '(:box t :background "gray20" :foreground "white" :weight bold :height 2.0))
      (insert "  ")
      (insert-button " ⏩ "
                     'action (lambda (_) (emms-seek-to 10))
                     'follow-link t
                     'face '(:box t :background "gray20" :foreground "white" :weight bold :height 2.0))
      (insert "  ")
      (insert-button " ⏮ "
                     'action (lambda (_) (emms-previous))
                     'follow-link t
                     'face '(:box t :background "gray20" :foreground "white" :weight bold :height 2.0))
      (insert "  ")
      (insert-button " ⏭ "
                     'action (lambda (_) (emms-next))
                     'follow-link t
                     'face '(:box t :background "gray20" :foreground "white" :weight bold :height 2.0))
      (read-only-mode 1)
      (redisplay)
      )))

(defun display-cover-art ()
  (interactive)
  (let ((current-song-full-path (find-file-name-from-current-song)))
    (if (not current-song-full-path)
        (message "No track to display")
      (progn
        (with-current-buffer "*EMMS Overview*"
          (erase-buffer)
          (remove-images 0 2 "*EMMS Overview*")
          (set-album-art-from-filepath current-song-full-path)
          (goto-char 3)
          (insert (create-info-table)))
        ))))

(defun get-file-extension-from-filepath (file-path)
  (let* ((ext (file-name-extension file-path))  ;; ext is a string like "jpg"
         (ext-sym (and ext (intern ext))))       ;; convert to symbol 'jpg
    ext-sym))

(defun create-image-from-filepath (file-full-path)
  (when file-full-path
    (create-image file-full-path
                  nil
                  nil
                  :width 300
                  :height 300)))

;; Set album art
(defun set-album-art-from-filepath (filename)
  ( let* ((album-directory (file-name-directory filename))
          (cover-art-path (find-first-cover-or-image album-directory))
          (cover-art (create-image-from-filepath cover-art-path)))
    (with-current-buffer "*EMMS Overview*"
      (when cover-art-path
        (put-image cover-art 1)))))

(defun find-file-name-from-current-song ()
  (cdr (assoc 'name (emms-playlist-current-selected-track))))

(defun find-first-cover-or-image (directory)
  "Return the first 'cover.jpg' or 'cover.png' (case-insensitive) in DIRECTORY.
If none found, return the first image file (jpg, jpeg, png, gif, bmp) found.
Returns full path or nil if no image found."
  (when directory
    (when (file-directory-p directory)
      (let ((case-fold-search t)
            (files (directory-files directory t ".*")))
        ;; Try to find cover.jpg or cover.png first
        (or (seq-find (lambda (f)
                        (string-match-p
                         "\\`cover\\.\\(jpg\\|jpeg\\|png\\)\\'"
                         (file-name-nondirectory f)))
                      files)
            ;; If none, find first image file with common extensions
            (seq-find (lambda (f)
                        (string-match-p
                         "\\`.*\\.\\(jpg\\|jpeg\\|png\\|gif\\|bmp\\)\\'"
                         (file-name-nondirectory f)))
                      files))))))

(defun find-title-from-current-song ()
  (cdr (assoc 'info-title (emms-playlist-current-selected-track))))

(defun find-album-from-current-song ()
  (cdr (assoc 'info-album (emms-playlist-current-selected-track))))

(defun find-artist-from-current-song ()
  (cdr (assoc 'info-artist (emms-playlist-current-selected-track))))

(defun create-info-table ()
  (format
   (concat
    "\n"
    "Title: %s\n"
    "Album:  %s\n"
    "Artist: %s\n")
   (find-title-from-current-song)
   (find-album-from-current-song)
   (find-artist-from-current-song)))

;; EMMS progress bar

(defun create-progress-bar ()
  (concat "["
          (make-string 10 ?-)
          "]"))

(defun find-first-bracket-position ()
  (save-excursion
    (goto-char (point-min))
    (let ((pos (search-forward "[" nil t)))
      (when pos (1- pos)))))

(defun chunyang-emms-indicate-seek (_sec)
  (let* ((total-playing-time (emms-track-get
                              (emms-playlist-current-selected-track)
                              'info-playing-time))
         (elapsed/total (/ (* 100 emms-playing-time) total-playing-time)))
    (with-temp-message (format "[%-100s] %2d%%"
                               (make-string elapsed/total ?=)
                               elapsed/total)
      (sit-for 2))))

(add-hook 'emms-player-seeked-functions #'chunyang-emms-indicate-seek 'append)
