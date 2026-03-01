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
