(require 'ggtags)


(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1))))

(add-hook 'python-mode-hook
          (lambda ()
              (ggtags-mode 1)))

(setq-local imenu-create-index-function #'ggtags-build-imenu-index)
