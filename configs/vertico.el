;;; configs/vertico.el -*- lexical-binding: t; -*-

;; Vertico popup frame
(vertico-posframe-mode 1)
(setq vertico-count 50)

;; Set vertico fringes
(setq vertico-posframe-parameters
      '((left-fringe . 20)
        (right-fringe . 8)))
