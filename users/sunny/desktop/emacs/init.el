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


;; Associate file extensions with respective modes
(add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-mode))
(add-to-list 'auto-mode-alist '("\\.typ\\'" . typst-ts-mode))
(add-to-list 'auto-mode-alist '("\\.tex\\'" . teX-mode))
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

;; Browser and font
(setq browse-url-browser-function 'browse-url-xdg-open)
(set-face-attribute 'default nil :family "Aporetic Sans Mono" :height 110)

;; Line numbers
(global-display-line-numbers-mode 1)
(defun display-line-numbers--turn-on ()
  "Turn on `display-line-numbers-mode'."
  (unless (or (minibufferp) (eq major-mode 'pdf-view-mode))
    (display-line-numbers-mode)))
(column-number-mode t)

;; Themes
(add-to-list 'custom-theme-load-path (expand-file-name "themes/" user-emacs-directory))
(load-theme 'matugen t)

(add-to-list 'load-path (expand-file-name "modules" user-emacs-directory))
(load "org-config")
(load "meow-config")
(load "direnv-config")
(load "corfu-config")
(load "eglot-config")
(load "flymake-config")
(load "apheleia-config")
(load "languages-config")
