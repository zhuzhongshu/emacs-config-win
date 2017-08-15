(require 'helm-tramp)
(setq tramp-default-method "ssh")
(defalias 'exit-tramp 'tramp-cleanup-all-buffers)

(eval-after-load 'tramp '(setenv "SHELL" "/bin/bash"))

(setq helm-tramp-docker-user "mqq")

(provide 'init-helm-tramp)
;;; init-auto-complie.el ends here

