;;; flymake-config.el --- Emacs configuration -*- lexical-binding: t; -*-

(use-package flymake
  :ensure nil
  :defer t
  :bind (("M-?" . xref-find-references)
         ("M-." . xref-find-definitions))
  :config
  (setq eldoc-echo-area-use-multiline-p t
        flymake-show-diagnostics-at-end-of-line t)

  (defun my/nil-flymake-backend (report-fn &rest _args)
    (unless (executable-find "nil")
      (error "nil executable not found"))
    (let* ((source (current-buffer))
           (temp-file (make-temp-file "nil" nil ".nix"))
           (proc (make-process
                  :name "nil-flymake"
                  :buffer (generate-new-buffer " *nil-flymake*")
                  :command (list "nil" "diagnostics" temp-file)
                  :noquery t
                  :sentinel (lambda (p _e)
                              (when (eq 'exit (process-status p))
                                (funcall report-fn nil)
                                (kill-buffer (process-buffer p)))))))
      (with-temp-file temp-file
        (insert-buffer-substring source))))

  (add-hook 'nix-ts-mode-hook
            (lambda ()
              (add-hook 'flymake-diagnostic-functions #'my/nil-flymake-backend nil t))))

(provide 'flymake-config)
