;; Eglot
(require 'eglot)

(setq eglot-autoshutdown t)
(setq eglot-send-changes-idle-time 0.1)

(dolist (hook '(nix-mode-hook
                rust-mode-hook
                java-mode-hook
                typst-ts-mode-hook
                LaTeX-mode-hook
                tex-mode-hook
                go-mode-hook))
  (add-hook hook #'eglot-ensure))

(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               '(nix-mode . ("nixd")))

  (add-to-list 'eglot-server-programs
               '(typst-ts-mode . ("tinymist")))

  (add-to-list 'eglot-server-programs
               '((LaTeX-mode latex-mode tex-mode bibtex-mode yatex-mode)
                 . ("texlab")))

  (add-to-list 'eglot-server-programs
               '(rust-mode . ("rust-analyzer")))

  (add-to-list 'eglot-server-programs
               '(go-mode . ("gopls")))

  (add-to-list 'eglot-server-programs
               '(java-mode . ("jdtls"))))

(setq eglot-ignored-server-capabilities
      '(:documentFormattingProvider
        :documentRangeFormattingProvider))
