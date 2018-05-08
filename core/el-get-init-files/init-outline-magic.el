(require 'outline-magic)


(add-hook 'text-mode-hook   'outline-minor-mode)
(add-hook 'c-mode-common-hook   'outline-minor-mode)
(add-hook 'python-mode-hook     'outline-minor-mode)
(add-hook 'java-mode-hook       'outline-minor-mode)
(add-hook 'json-mode-hook       'outline-minor-mode)
(add-hook 'lisp-mode-hook       'outline-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'outline-minor-mode)
(add-hook 'perl-mode-hook       'outline-minor-mode)
(add-hook 'sh-mode-hook         'outline-minor-mode)
