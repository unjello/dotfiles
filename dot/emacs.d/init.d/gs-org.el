(require 'org-agenda)

(setq org-directory "~/org")
(setq org-default-notes-file "~/org/refile.org")
(defvar org-default-diary-file "~/org/diary.org")
(setq org-agenda-files (quote ("~/org" "~/org/archive")))

;; Display properties
(setq org-cycle-separator-lines 0)
(setq org-tags-column 80)
(setq org-agenda-tags-column org-tags-column)
(setq org-agenda-sticky t)

(provide 'gs-org)
