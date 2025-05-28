;;; mail.el -*- lexical-binding: t; -*-

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
