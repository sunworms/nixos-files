;;; apheleia-config.el --- Emacs configuration -*- lexical-binding: t; -*-

(use-package apheleia
  :ensure nil
  :hook (after-init . apheleia-global-mode)
  :config
  (setf (alist-get 'nixfmt apheleia-formatters) '("nixfmt"))
  (setf (alist-get 'typstyle apheleia-formatters) '("typstyle"))
  (setf (alist-get 'rust-mode apheleia-mode-alist) 'rustfmt)
  (setf (alist-get 'go-mode apheleia-mode-alist) 'gofmt)
  (setf (alist-get 'nix-mode apheleia-mode-alist) 'nixfmt)
  (setf (alist-get 'typst-ts-mode apheleia-mode-alist) 'typstyle))

(provide 'apheleia-config)
