;;; languages-config.el --- Emacs configuration -*- lexical-binding: t; -*-

;; Nix
(use-package nix-ts-mode
  :ensure nil
  :defer t
  :mode "\\.nix\\'")

;; Rust
(use-package rust-mode
  :ensure nil
  :defer t
  :mode "\\.rs\\'"
  :config
  (setq rust-mode-treesitter-derive t))

(use-package rustic
  :ensure nil
  :defer t
  :config
  (setq rustic-format-on-save t
        rustic-compile-command "cargo check"))

;; Java
(use-package eglot-java
  :ensure nil
  :defer t
  :hook (java-mode . eglot-java-mode))

;; PDF Tools
(use-package pdf-tools
  :ensure nil
  :defer t
  :mode ("\\.pdf\\'" . pdf-view-mode)
  :config
  (setq pdf-view-continuous 1)
  (add-hook 'pdf-view-mode-hook #'pdf-tools-install))

;; Go
(use-package go-mode
  :ensure nil
  :defer t
  :mode "\\.go\\'"
  :config
  (add-hook 'go-mode-hook
            (lambda ()
              (add-hook 'before-save-hook
                        (lambda () (call-interactively 'eglot-code-action-organize-imports))
                        nil t))))

;; LaTeX / AUCTeX
(use-package auctex
  :ensure nil
  :defer t
  :mode ("\\.tex\\'" . latex-mode)
  :config
  (setq TeX-auto-save t
        TeX-parse-self t
        TeX-save-query nil
        TeX-PDF-mode t
        TeX-view-program-selection '((output-pdf "PDF Tools"))
        TeX-source-correlate-mode t)
  (add-hook 'LaTeX-mode-hook
            (lambda ()
              (turn-on-reftex)
              (visual-line-mode)
              (LaTeX-math-mode)
              (cdlatex-mode))))

;; Typst
(use-package typst-preview
  :ensure nil)
(use-package typst-ts-mode
  :ensure nil
  :defer t
  :mode "\\.typ\\'"
  :config
  (setq typst-ts-watch-options "--open")
  :bind (:map typst-ts-mode-map
              ("C-c C-j" . typst-preview-send-position)
              ("C-c C-s" . typst-preview-start)
              ("M-s M-c" . typst-preview-stop)))

(provide 'languages-config)
