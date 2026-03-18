;;; company-config.el --- Emacs configuration -*- lexical-binding: t; -*-

(use-package yasnippet
  :ensure nil
  :defer t
  :hook (after-init . yas-global-mode))

(use-package company
  :ensure nil
  :defer t
  :hook (after-init . global-company-mode)
  :config
  (setq company-idle-delay 0.1
        company-minimum-prefix-length 1
        company-tooltip-align-annotations t
        company-selection-wrap-around t)
  (add-to-list 'company-backends 'company-capf))

(provide 'company-config)
