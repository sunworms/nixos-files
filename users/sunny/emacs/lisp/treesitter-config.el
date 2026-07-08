;;; treesitter-config.el --- Emacs configuration -*- lexical-binding: t; -*-

(use-package treesit-auto
  :ensure nil
  :defer t
  :hook (after-init . global-treesit-auto-mode))

(provide 'treesitter-config)
