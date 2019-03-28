(require 'use-package)

(use-package company               
  :ensure t
  :defer t
  :init (global-company-mode)
  :diminish company-mode)