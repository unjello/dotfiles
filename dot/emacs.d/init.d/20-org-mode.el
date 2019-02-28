(require 'use-package)

(use-package org
  :ensure org-plus-contrib
  :init
  (add-hook 'org-mode-hook 'visual-line-mode)
  (add-hook 'org-mode-hook 'org-indent-mode)
  (add-hook 'org-mode-hook 'flyspell-mode)
  (setq org-mobile-directory "~/notes")
  :diminish visual-line-mode
  :diminish org-indent-mode
  :defer t
  :bind (("\C-c a" . org-agenda)
	 ("\C-c c" . org-capture))
  :config


  (defun unj/diminish-org-indent ()
    "Diminish org-indent-mode on the modeline"
    (interactive)
    (diminish 'org-indent-mode ""))
  (add-hook 'org-indent-mode-hook #'unj/diminish-org-indent)

  ;; Fix evil-auto-indent for org buffers.
  (defun unj/org-disable-evil-auto-indent nil
    "Disables evil's auto-indent for org."
    (setq evil-auto-indent nil)
    )
  (add-hook 'org-mode-hook #'unj/org-disable-evil-auto-indent)
  
  ;; Custom functions for emacs & org mode
  (load-file "~/.emacs.d/init.d/gs-org.el")
  (require 'org)

  (setq org-display-inline-images t)
  (setq org-redisplay-inline-images t)
  (setq org-startup-with-inline-images "inlineimages")

  ;; == Agenda ==
  (defvar org-agenda-window-setup)
  (setq org-agenda-window-setup 'current-window)

  ;; Run/highlight code using babel in org-mode
  (org-babel-do-load-languages
   'org-babel-load-languages
   '(
     (python . t)
     (ipython . t)
     (octave . t)
     (C . t)
     (C++ . t)
     (shell . t)
     ))
  ;; Syntax hilight in #+begin_src blocks
  (setq org-src-fontify-natively t)
  ;; Don't prompt before running code in org
  (setq org-confirm-babel-evaluate nil)
  ;; Display inline images after running code
  (add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)

  ;; Org + LaTeX
  (with-eval-after-load 'ox-latex
    (add-to-list 'org-latex-classes
	       '("book-noparts"
		 "\\documentclass{book}"
		 ("\\chapter{%s}" . "\\chapter*{%s}")
		 ("\\section{%s}" . "\\section*{%s}")
		 ("\\subsection{%s}" . "\\subsection*{%s}")
		 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
		 ("\\paragraph{%s}" . "\\paragraph*{%s}")
		 ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))


  (use-package helm-org-rifle
    :ensure t)

  (use-package ob-async
    :ensure t
    :config
    (setq ob-async-no-async-languages-alist '("ipython"))
    )

  (use-package ob-ipython
    :ensure t)

  ;; Capture mode
  (add-hook 'org-capture-mode-hook 'evil-insert-state)
  (general-define-key
   :keymaps 'org-capture-mode-map
   :states '(normal motion)
   :prefix gjs-leader-key
   "c" 'org-capture-finalize
   "k" 'org-capture-kill
   "w" 'org-capture-refile
   )

  ;; Evil key configurations (agenda)
  (evil-set-initial-state 'org-agenda-mode 'normal)
  (defvar org-agenda-mode-map)
  (general-define-key
   :keymaps 'org-agenda-mode-map
   :states '(normal motion)
   "l" 'org-agenda-later
   "h" 'org-agenda-earlier
   "j" 'org-agenda-next-line
   "k" 'org-agenda-previous-line
   (kbd "RET") 'org-agenda-switch-to
   [escape] 'org-agenda-quit
   "q" 'org-agenda-quit
   "s" 'org-save-all-org-buffers
   "t" 'org-agenda-todo
   "T" 'org-agenda-set-tags
   "g" 'org-agenda-redo
   "v" 'org-agenda-view-mode-dispatch
   "." 'org-agenda-goto-today
   "J" 'gs/org-agenda-next-section
   "K" 'gs/org-agenda-prev-section
   "c" 'org-agenda-goto-calendar
   "i" 'org-agenda-clock-in
   "o" 'org-agenda-clock-out
   )
  (general-define-key
   :keymaps 'org-agenda-mode-map
   :prefix gjs-leader-key
   :states '(normal motion)
   "" '(:ignore t :which-key "Agenda")
   "i" 'org-agenda-clock-in
   "k" 'org-agenda-kill
   "o" 'org-agenda-clock-out
   "t" 'org-agenda-todo
   "w" 'org-agenda-refile
   "/" 'org-agenda-filter-by-tag
   "c/" '(helm-org-rifle :which-key "org-rifle")
   )

  (general-define-key
   :prefix (concatenate 'string gjs-leader-key)
   :keymaps 'org-mode-map
   :states '(normal motion)
   "i" '(org-clock-in :which-key "clock in")
   "o" '(org-clock-out :which-key "clock out")
   "t" '(org-todo :which-key "todo state")
   "ct" '(org-todo :which-key "todo state")
   "ce" '(org-export-dispatch :which-key "org export")
   "cp" '(org-set-property :which-key "org set property")
   "c/" '(helm-org-rifle :which-key "org-rifle")
   )
  ;; some functions for timing
  )

(defun org-build-agenda ()
  (interactive)
  (setq last-build-time (format-time-string "%S.%3N"))
  (org-agenda 0 " ")
  (setq after-build-time (format-time-string "%S.%3N"))
  (print last-build-time)
  (print after-build-time)
  )

