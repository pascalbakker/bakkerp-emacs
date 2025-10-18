;;; configs/projectile.el -*- lexical-binding: t; -*-

;; Projectile
(after! projectile
  (add-to-list 'projectile-project-root-files "Config"))

(setq projectile-project-search-path '("~/projects/" "~/dev/" "~/code/"))
