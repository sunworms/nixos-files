;;; init.el --- Emacs configuration -*- lexical-binding: t; -*-

;; General options
(setq
 lexical-binding t
 electric-pair-mode t
 inhibit-startup-screen t
 make-backup-files nil
 x-select-enable-clipboard t
 delete-old-versions t
 version-control t
 create-lockfiles nil)

;; Org mode
(setq org-directory "~/Documents/org")
(setq org-journal-dir (concat org-directory "/journal"))
(setq org-notes-dir (concat org-directory "/notes"))

(make-directory org-journal-dir t)
(make-directory org-notes-dir t)

(setq org-capture-templates
      ` (("j" "Journal (daily)" entry
          (file ,(concat org-journal-dir "/" (format-time-string "%Y-%m-%d.org")))
          "* %U\n\n%?\n")

         ("n" "Note (daily)" entry
          (file ,(concat org-notes-dir "/" (format-time-string "%Y-%m-%d.org")))
          "* %U\n\n%?\n")))

(setq org-agenda-files (list org-directory))
(setq org-startup-indented t)
(setq org-hide-emphasis-markers t)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((shell . t)))

(setq org-confirm-babel-evaluate nil)
(global-set-key (kbd "C-c c") 'org-capture)

;; General toggles
(electric-pair-mode 1)
(auto-save-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(defun my/disable-scroll-bars (frame)
  (modify-frame-parameters frame
                           '((vertical-scroll-bars . nil)
                             (horizontal-scroll-bars . nil))))
(add-hook 'after-make-frame-functions 'my/disable-scroll-bars)

;; Browser and font
(setq browse-url-browser-function 'browse-url-xdg-open)
(set-face-attribute 'default nil :family "D2CodingLigature Nerd Font Mono" :height 110)

;; Line numbers
(global-display-line-numbers-mode 1)
(defun display-line-numbers--turn-on ()
    "Turn on `display-line-numbers-mode'."
    (unless (or (minibufferp) (eq major-mode 'pdf-view-mode))
      (display-line-numbers-mode)))

;; Themes
(add-to-list 'custom-theme-load-path (expand-file-name "themes/" user-emacs-directory))
(load-theme 'dank-emacs t)

;; Telephone-line
(require 'telephone-line)
(telephone-line-mode 1)

;; Direnv-mode
(require 'direnv)
(defun my/enable-direnv-if-envrc ()
  "Enable direnv-mode only if an .envrc exists in project root."
  (when-let ((root (or (locate-dominating-file default-directory ".envrc")
                       (locate-dominating-file default-directory ".direnv"))))
    (direnv-mode 1)))

(add-hook 'find-file-hook #'my/enable-direnv-if-envrc)
(add-hook 'dired-mode-hook #'my/enable-direnv-if-envrc)

;; Eglot
(require 'eglot)

(setq eglot-autoshutdown t)
(setq eglot-send-changes-idle-time 0.1)

(dolist (hook '(nix-mode-hook
                rust-mode-hook
                java-mode-hook
                typst-ts-mode-hook
                LaTeX-mode-hook
                tex-mode-hook))
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
               '(java-mode . ("jdtls"))))

;; Flymake
(require 'flymake)

(defun my/nil-flymake-backend (report-fn &rest _args)
  (unless (executable-find "nil")
    (error "nil executable not found"))

  (let* ((source (current-buffer))
         (temp-file (make-temp-file "nil" nil ".nix"))
         (proc
          (make-process
           :name "nil-flymake"
           :buffer (generate-new-buffer " *nil-flymake*")
           :command (list "nil" "diagnostics" temp-file)
           :noquery t
           :sentinel
           (lambda (p _e)
             (when (eq 'exit (process-status p))
               (funcall report-fn nil)
               (kill-buffer (process-buffer p)))))))

    (with-temp-file temp-file
      (insert-buffer-substring source))))

(add-hook 'nix-mode-hook
          (lambda ()
            (add-hook 'flymake-diagnostic-functions
                      #'my/nil-flymake-backend
		      nil t)))

;; Documentation
(setq eldoc-echo-area-use-multiline-p t)

(setq flymake-show-diagnostics-at-end-of-line t)

(global-set-key (kbd "M-?") #'xref-find-references)
(global-set-key (kbd "M-.") #'xref-find-definitions)

;; Company-mode
(require 'company)
(setq company-idle-delay 0.1
      company-minimum-prefix-length 1
      company-tooltip-align-annotations t
      company-selection-wrap-around t)
(global-company-mode)

(with-eval-after-load 'company
  (add-to-list 'company-backends 'company-capf))

;; Associate file extensions with respective modes
(add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-mode))
(add-to-list 'auto-mode-alist '("\\.typ\\'" . typst-ts-mode))
(add-to-list 'auto-mode-alist '("\\.tex\\'" . teX-mode))

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
