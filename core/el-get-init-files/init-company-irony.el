;; (require 'company)
;; (eval-after-load 'company
;;   '(add-to-list 'company-backends 'company-irony))
;; (add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)
;; (setq irony-additional-clang-options  '("-I/usr/include/eigen3"))
;; (add-hook 'c-mode-common-hook
;;           (lambda ()
;;             (set (make-local-variable 'company-backends)  (quote (company-irony
;;                                                                   company-yasnippet
;;                                                                   company-files)))))
