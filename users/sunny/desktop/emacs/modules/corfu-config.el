;;; corfu-config.el --- Emacs configuration -*- lexical-binding: t; -*-

;; Corfu
(require 'corfu)
(global-corfu-mode)

(setq corfu-auto t
      corfu-auto-delay 0.1
      corfu-auto-prefix 1)

;; better CAPF ordering
(require 'cape)
(add-to-list 'completion-at-point-functions #'cape-file)
