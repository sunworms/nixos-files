;;; lsp-config.el --- Emacs configuration -*- lexical-binding: t; -*-

(use-package lsp-mode
  :ensure nil
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook ((nix-ts-mode
          rust-mode
          java-mode
          typst-ts-mode
          latex-mode
          go-mode) . lsp-deferred)
  :commands (lsp lsp-deferred)
  :config
  (require 'lsp-modeline)
  (require 'lsp-headerline)
  (require 'lsp-lens)
  
  (setq lsp-idle-delay 0.1
        lsp-keep-workspace-alive nil
        lsp-enable-file-watchers nil
        lsp-eldoc-render-all t)

  (setq lsp-enable-indentation nil
        lsp-enable-on-type-formatting nil)

  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection '("nixd"))
                    :major-modes '(nix-ts-mode nix-mode)
                    :priority 1
                    :server-id 'nixd))

  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection '("nil"))
                    :major-modes '(nix-ts-mode nix-mode)
                    :priority 0
                    :add-on? t
                    :server-id 'nil)))

(use-package lsp-ui
  :ensure nil
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-doc-enable t
        lsp-ui-peek-enable t))

(provide 'lsp-config)
