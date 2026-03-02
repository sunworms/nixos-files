;;; direnv-config.el --- Emacs configuration -*- lexical-binding: t; -*-

;; Direnv-mode
(require 'direnv)
(defun my/enable-direnv-if-envrc ()
  "Enable direnv-mode only if an .envrc exists in project root."
  (when-let* ((root (or (locate-dominating-file default-directory ".envrc")
			(locate-dominating-file default-directory ".direnv"))))
    (direnv-mode 1)))

(add-hook 'find-file-hook #'my/enable-direnv-if-envrc)
(add-hook 'dired-mode-hook #'my/enable-direnv-if-envrc)
