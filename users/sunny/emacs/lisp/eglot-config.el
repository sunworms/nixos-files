;;; eglot-config.el --- Emacs configuration -*- lexical-binding: t; -*-

(use-package eglot
  :ensure nil
  :hook ((nix-ts-mode
          rust-mode
          java-mode
          typst-ts-mode
          LaTeX-mode
          tex-mode
          go-mode) . eglot-ensure)
  
  :config
  (setq eglot-autoshutdown t
        eglot-send-changes-idle-time 0.1
        eglot-ignored-server-capabilities
        '(:documentFormattingProvider
		  :documentRangeFormattingProvider
		  :textDocumentSync))

  (add-to-list 'eglot-server-programs '(nix-ts-mode . ("rass"
													"--"
													"nixd"
													"--"
													"nil" "--stdio")))
  (add-to-list 'eglot-server-programs '(typst-ts-mode . ("tinymist")))
  (add-to-list 'eglot-server-programs
               '((LaTeX-mode latex-mode tex-mode bibtex-mode yatex-mode) . ("texlab")))
  (add-to-list 'eglot-server-programs '(rust-mode . ("rust-analyzer")))
  (add-to-list 'eglot-server-programs '(go-mode . ("gopls")))
  (add-to-list 'eglot-server-programs '(java-mode . ("jdtls"))))

(provide 'eglot-config)
