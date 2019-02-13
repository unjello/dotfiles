(require 'use-package)

(use-package 
	ansible 
	:ensure t
	:init
	(add-hook 'yaml-mode-hook '(lambda () (ansible 1)))
	)

(use-package 
	highlight-indent-guides 
	:ensure t
	:init
	(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
	)
