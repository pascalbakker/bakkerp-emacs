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

;; Garbage collection threshold
(setq gc-cons-threshold (* 100 1024 1024))

;; Consult live preview
(setq consult-preview-enable t)
