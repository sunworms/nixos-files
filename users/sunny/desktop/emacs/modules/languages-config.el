;; Rust mode
(require 'rust-mode)
(setq rust-mode-treesitter-derive t)
(with-eval-after-load 'rust-mode
  (require 'rustic nil t))
(setq rustic-format-on-save t)
(setq rustic-compile-command "cargo check")

;; Eglot Java
(require 'eglot-java)

;; PDF tools
(require 'pdf-tools)
(setq pdf-view-continuous 1)

;; Go mode
(require 'go-mode)
(add-hook 'before-save-hook
    (lambda ()
        (call-interactively 'eglot-code-action-organize-imports))
    nil t)

;; LaTeX stuff
(require 'auctex)
(setq TeX-auto-save t
     TeX-parse-self t
     TeX-save-query nil
     TeX-PDF-mode t
     TeX-view-program-selection '((output-pdf "PDF Tools"))
     TeX-source-correlate-mode t
     TeX-source-correlate-start-server t)

(add-hook 'LaTeX-mode-hook
	  (lambda ()
	   (pdf-tools-install)
	   (turn-on-reftex)
	   (turn-on-font-lock)
	   (visual-line-mode)
	   (flyspell-mode)
	   (LaTeX-math-mode)
	   (cdlatex-mode)))
(add-hook 'TeX-after-compilation-finished-functions
	 #'TeX-revert-document-buffer)

(setq tex-command "platex --synctex=1")

(setq lsp-latex-forward-search-executable "emacsclient")
(setq lsp-latex-forward-search-args
      '("--eval"
        "(lsp-latex-forward-search-with-pdf-tools \"%f\" \"%p\" \"%l\")"))

;; Typst stuff
(require 'typst-ts-mode)
(require 'typst-preview)
(setq typst-ts-watch-options "--open")
(add-hook 'typst-ts-mode-hook
	  (lambda ()
	   (local-set-key (kbd "C-c C-j") 'typst-preview-send-position)
	   (local-set-key (kbd "C-c C-s") 'typst-preview-start)
	   (local-set-key (kbd "M-s M-c") 'typst-preview-stop)))
