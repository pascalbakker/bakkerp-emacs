;;; configs/company.el -*- lexical-binding: t; -*-

(setq company-transformers '(company-sort-by-occurrence
                             company-sort-prefer-same-case-prefix))
(setq company-idle-delay 0.1)
(setq company-minimum-prefix-length 2)
