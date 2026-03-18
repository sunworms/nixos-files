;;; init.el --- Emacs configuration -*- lexical-binding: t; -*-

;; General options
(setq
 inhibit-startup-screen t
 make-backup-files nil
 x-select-enable-clipboard t
 delete-old-versions t
 version-control t
 create-lockfiles nil)

;; General toggles
(electric-pair-mode 1)
(auto-save-mode -1)

;; Browser and font
(setq browse-url-browser-function 'browse-url-xdg-open)
(set-face-attribute 'default nil :family "Aporetic Sans Mono" :height 110)

(unless (display-graphic-p)
  (set-face-attribute 'default nil :background "unspecified-bg")
  (set-terminal-parameter nil 'background-mode 'dark))

;; Line numbers
(add-hook 'after-init-hook #'global-display-line-numbers-mode)
(defun display-line-numbers--turn-on ()
  "Turn on `display-line-numbers-mode'."
  (unless (or (minibufferp) (eq major-mode 'pdf-view-mode))
    (display-line-numbers-mode)))
(add-hook 'after-init-hook #'column-number-mode)

;; Themes
(add-to-list 'custom-theme-load-path (expand-file-name "themes/" user-emacs-directory))
(load-theme 'dank-emacs t)

(use-package magit
  :ensure nil
  :defer t
  :bind ("C-x g" . magit-status))

(use-package direnv-config
  :load-path "lisp/")
(use-package treesitter-config
  :load-path "lisp/")
(use-package company-config
  :load-path "lisp/")
(use-package eglot-config
  :load-path "lisp/")
(use-package flymake-config
  :load-path "lisp/")
(use-package apheleia-config
  :load-path "lisp/")
(use-package languages-config
  :load-path "lisp/")
