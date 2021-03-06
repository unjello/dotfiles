;; Code inspired by:
;; https://github.com/gjstein/emacs.d/blob/master/init.el

;; Install use-package if necessary
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives (append package-archives
			 '(("melpa" . "http://melpa.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("gnu" . "http://elpa.gnu.org/packages/")
			 ("org" . "http://orgmode.org/elpa/")
			 ("elpy" . "http://jorgenschaefer.github.io/packages/"))))
(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package diminish :ensure t)

;; Enable use-package
(eval-when-compile
  (require 'use-package))
(require 'diminish)                ;; if you use :diminish
(require 'bind-key)                ;; if you use any :bind variant

(load-file "~/.emacs.d/init.d/10-theme.el")
(load-file "~/.emacs.d/init.d/10-company.el")
(load-file "~/.emacs.d/init.d/20-org-mode.el")
(load-file "~/.emacs.d/init.d/40-java.el")
(load-file "~/.emacs.d/init.d/60-ansible.el")
