;;; apheleia-config.el --- Emacs configuration -*- lexical-binding: t; -*-
(require 'apheleia)
(apheleia-global-mode +1)
(with-eval-after-load 'apheleia
  (setf (alist-get 'nixfmt apheleia-formatters)
        '("nixfmt"))
  (setf (alist-get 'rust-mode apheleia-mode-alist)
	'rustfmt)
  (setf (alist-get 'go-mode apheleia-mode-alist)
	'gofmt)
  (setf (alist-get 'nix-mode apheleia-mode-alist)
        'nixfmt))
