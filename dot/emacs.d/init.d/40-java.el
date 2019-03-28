(require 'use-package)


(use-package 
  eclim
  :ensure company-emacs-eclim
  :init
  (custom-set-variables
    '(eclim-eclipse-dirs '("/opt/eclipse"))
    '(eclim-executable "/opt/eclipse/eclim")
    '(eclimd-default-workspace "~/.workspace"))
  (add-hook 'java-mode-hook (lambda () (eclim-mode t)))
  (setq eclimd-autostart t)
  )
