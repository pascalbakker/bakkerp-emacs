;;; configs/general.el -*- lexical-binding: t; -*-

;; General settings

(setq display-line-numbers-type t)

(setq org-directory "~/org/")

(setq doom-theme 'doom-one)

(setq doom-font (font-spec :family "Iosevka" :weight 'regular :size 14))

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
