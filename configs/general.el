;;; configs/general.el -*- lexical-binding: t; -*-

;; General settings

(setq display-line-numbers-type t)

(setq org-directory "~/org/")

;; Use wombat theme
(load-theme 'doom-one t)  

;; a great font: https://www.fontyukle.net/en/Monaco.ttf
(condition-case nil
    (set-default-font "Monaco")
  (error nil))

;;(add-to-list 'default-frame-alist '(font . "JetBrains Mono-13"))
;;(set-face-attribute 'default nil :family "JetBrains Mono" :height 130)
;;(set-face-attribute 'variable-pitch nil :family "JetBrains Mono" :height 1.0)
;;(set-face-attribute 'fixed-pitch nil :family "JetBrains Mono" :height 1.0)

(add-to-list 'default-frame-alist '(font . "Iosevka-13"))

(set-face-attribute 'default nil :family "Iosevka" :height 130)
(set-face-attribute 'variable-pitch nil :family "Iosevka" :height 1.0)
(set-face-attribute 'fixed-pitch nil :family "Iosevka" :height 1.0)

(setq-default
 frame-resize-pixelwise t
 x-underline-at-descent-line t
 inhibit-compacting-font-caches t)

(setq display-line-numbers-type t)

;; pixel scrolling
(pixel-scroll-precision-mode t)

;; Allow drag changing width of treemacs
(setq treemacs--width-is-locked nil)

;; abbr
(setq-default abbrev-mode t)

;;; Improve performance by tweaking garbage collection thresholds

;; Raise threshold during startup (default is ~800KB)
(setq gc-cons-threshold (* 200 1024 1024))  ;; 200 MB
(setq gc-cons-percentage 0.6)               ;; Allow GC to use more heap space

;; Reset after startup to a more reasonable value
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 100 1024 1024))  ;; 50 MB
            (setq gc-cons-percentage 0.1)))

;; Consult live preview
(setq consult-preview-enable t)
