;;; init.el --- Emacs configuration -*- lexical-binding: t; -*-

(setq
 lexical-binding t
 electric-pair-mode t
 inhibit-startup-screen t
 make-backup-files nil
 x-select-enable-clipboard t
 delete-old-versions t
 version-control t
 create-lockfiles nil)

(electric-pair-mode 1)
(auto-save-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(defun my/disable-scroll-bars (frame)
  (modify-frame-parameters frame
                           '((vertical-scroll-bars . nil)
                             (horizontal-scroll-bars . nil))))
(add-hook 'after-make-frame-functions 'my/disable-scroll-bars)

(setq browse-url-browser-function 'browse-url-xdg-open)
(set-face-attribute 'default nil :family "D2CodingLigature Nerd Font Mono" :height 110)

(global-display-line-numbers-mode 1)
(defun display-line-numbers--turn-on ()
    "Turn on `display-line-numbers-mode'."
    (unless (or (minibufferp) (eq major-mode 'pdf-view-mode))
      (display-line-numbers-mode)))

(add-to-list 'custom-theme-load-path (expand-file-name "themes/" user-emacs-directory))
(load-theme 'dank-emacs t)

(setq explicit-shell-file-name "/etc/profiles/per-user/sunny/bin/fish")

(require 'telephone-line)
(telephone-line-mode 1)

(require 'direnv)
(direnv-mode)

(require 'lsp-mode)
(setq lsp-keymap-prefix "C-c l"
      lsp-enable-snippet t
      lsp-enable-symbol-highlighting t
      lsp-enable-on-type-formatting nil
      lsp-signature-auto-activate t
      lsp-signature-render-documentation t
      lsp-completion-provider :company-capf
      lsp-headerline-breadcrumb-enable t
      lsp-enable-suggest-server-download nil)

(dolist (hook '(nix-mode-hook rust-mode-hook java-mode-hook typst-ts-mode-hook LaTeX-mode-hook tex-mode-hook))
  (add-hook hook #'lsp-deferred))

(with-eval-after-load 'lsp-mode
  (setq lsp-enabled-clients '(nixd nil-ls texlab tinymist rust-analyzer jdtls))
  
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection "nixd")
                    :major-modes '(nix-mode)
                    :server-id 'nixd
                    :add-on? nil))
  
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection "nil")
                    :major-modes '(nix-mode)
                    :server-id 'nil-ls
                    :add-on? t))
  
  (add-to-list 'lsp-language-id-configuration '(typst-ts-mode . "typst"))
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection "tinymist")
                    :major-modes '(typst-ts-mode)
                    :server-id 'tinymist))
  
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection "texlab")
                    :major-modes '(LaTeX-mode latex-mode tex-mode bibtex-mode yatex-mode)
                    :server-id 'texlab)))

(require 'lsp-ui)
(setq lsp-ui-doc-enable t
      lsp-ui-doc-position 'at-point
      lsp-ui-doc-delay 0.5
      lsp-ui-sideline-enable t
      lsp-ui-sideline-show-hover t
      lsp-ui-sideline-show-diagnostics t
      lsp-ui-peek-enable t)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)

(require 'lsp-latex)

(with-eval-after-load "tex-mode"
 (add-hook 'tex-mode-hook 'lsp)
 (add-hook 'latex-mode-hook 'lsp))

(with-eval-after-load "yatex"
 (add-hook 'yatex-mode-hook 'lsp))

(with-eval-after-load "bibtex"
 (add-hook 'bibtex-mode-hook 'lsp))

(require 'company)
(setq company-idle-delay 0.1
      company-minimum-prefix-length 1
      company-tooltip-align-annotations t
      company-selection-wrap-around t)
(global-company-mode)

(with-eval-after-load 'company
  (add-to-list 'company-backends 'company-capf))

(add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-mode))
(add-to-list 'auto-mode-alist '("\\.typ\\'" . typst-ts-mode))
(add-to-list 'auto-mode-alist '("\\.tex\\'" . LaTeX-mode))

(require 'rust-mode)
(setq rust-mode-treesitter-derive t)
(with-eval-after-load 'rust-mode
  (require 'rustic nil t))
(setq rustic-lsp-server 'rust-analyzer)
(setq rustic-lsp-client 'lsp-mode)
(setq rustic-format-on-save t)
(setq rustic-compile-command "cargo check")

(require 'lsp-java)
(add-hook 'java-mode-hook #'lsp-java-boot-lens-mode)

(require 'pdf-tools)
(setq pdf-view-continuous t)

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
	   (lsp-mode)
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

(require 'typst-ts-mode)
(require 'typst-preview)
(setq typst-ts-watch-options "--open")
(add-hook 'typst-ts-mode-hook
	  (lambda ()
	   (local-set-key (kbd "C-c C-j") 'typst-preview-send-position)
	   (local-set-key (kbd "C-c C-s") 'typst-preview-start)
	   (local-set-key (kbd "M-s M-c") 'typst-preview-stop)))
