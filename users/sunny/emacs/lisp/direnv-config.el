;;; direnv-config.el --- Emacs configuration -*- lexical-binding: t; -*-

(use-package direnv
  :ensure nil
  :init
  (defun my/enable-direnv-if-envrc ()
    (when-let* ((root (or (locate-dominating-file default-directory ".envrc")
                          (locate-dominating-file default-directory ".direnv"))))
      (direnv-mode 1)))
  (add-hook 'find-file-hook #'my/enable-direnv-if-envrc)
  (add-hook 'dired-mode-hook #'my/enable-direnv-if-envrc))

(provide 'direnv-config)
