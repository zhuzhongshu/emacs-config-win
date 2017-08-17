
;;自动编译改动后的el文件
(add-hook 'python-mode-hook (lambda ()
                              (require 'sphinx-doc)
                              (sphinx-doc-mode t)))
(provide 'init-sphinx-doc)
;;; init-auto-complie.el ends here

