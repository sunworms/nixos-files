;; Meow mode
(require 'meow)
(setq meow-use-clipboard t)
(setq meow-leader-key "SPC")

(keymap-global-set "<escape>" #'keyboard-escape-quit)
(setq meow-cancel-selection-on-change t)

(defun meow-setup ()
  (setq meow-cheatsheet-layout meow-cheatsheet-layout-qwerty)
  (meow-normal-define-key
   '("0" . meow-digit-argument)
   '("1" . meow-digit-argument)
   '("2" . meow-digit-argument)
   '("3" . meow-digit-argument)
   '("4" . meow-digit-argument)
   '("5" . meow-digit-argument)
   '("6" . meow-digit-argument)
   '("7" . meow-digit-argument)
   '("8" . meow-digit-argument)
   '("9" . meow-digit-argument)
   
   '("i" . meow-insert)
   '("a" . meow-append)
   '("A" . meow-open-below)
   '("I" . meow-open-above)
   '("<escape>" . ignore)

   '("h" . meow-left)
   '("j" . meow-next)
   '("k" . meow-prev)
   '("l" . meow-right)

   '("w" . meow-next-word)
   '("b" . meow-back-word)
   '("e" . meow-next-word-end)

   '("#" . meow-beginning-of-thing)
   '("$" . meow-end-of-thing)

   '("v" . meow-mark-word)
   '("V" . meow-line)
   '("C-v" . meow-block)

   '("d" . meow-kill)
   '("c" . meow-change)
   '("y" . meow-save)
   '("p" . meow-yank)
   '("u" . undo)
   '("U" . undo-redo)
   '("," . meow-cancel-selection)

   '("+" . er/expand-region)
   '("-" . er/contract-region))

  (meow-leader-define-key
   '("f f" . find-file)
   '("f s" . save-buffer)
   '("f r" . recentf-open-files)
   '("f t" . treemacs)

   '("s s" . isearch-forward)
   '("s r" . query-replace)

   '("SPC" . execute-extended-command)

   '("q q" . save-buffers-kill-terminal)
   '("q r" . restart-emacs)

   '("w v" . split-window-right)
   '("w s" . split-window-below)
   '("w d" . delete-window)
   '("w o" . delete-other-windows)

   '("w h" . windmove-left)
   '("w j" . windmove-down)
   '("w k" . windmove-up)
   '("w l" . windmove-right)

   '("w H" . shrink-window-horizontally)
   '("w L" . enlarge-window-horizontally)
   '("w J" . shrink-window)
   '("w K" . enlarge-window)

   '("b b" . switch-to-buffer)
   '("b n" . next-buffer)
   '("b p" . previous-buffer)
   '("b k" . kill-current-buffer)
   '("b r" . revert-buffer)

   '("t n" . tab-bar-new-tab)
   '("t k" . tab-bar-close-tab)
   '("t l" . tab-bar-switch-to-next-tab)
   '("t h" . tab-bar-switch-to-prev-tab)
   '("t r" . tab-bar-rename-tab)

   '("p f" . project-find-file)
   '("p b" . project-switch-to-buffer)
   '("p k" . project-kill-buffers)
   '("p s" . project-shell)
))

(defun my/meow-minibuffer-setup ()
  (meow-insert-mode))

(add-hook 'minibuffer-setup-hook
          #'my/meow-minibuffer-setup)

(meow-setup)

(meow-global-mode 1)
