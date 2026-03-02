;;; company-config.el --- Emacs configuration -*- lexical-binding: t; -*-

;; Company-mode
(require 'company)
(require 'yasnippet)

(setq company-idle-delay 0.1
      company-minimum-prefix-length 1
      company-tooltip-align-annotations t
      company-selection-wrap-around t)
(global-company-mode)

(with-eval-after-load 'company
  (add-to-list 'company-backends 'company-capf))
