;; (require 'ycmd)

;; (setq ycmd-server-home (concat my-home-dir "\\.emacs.d\\ycmd\\ycmd\\"))
;; ;; (set-variable 'ycmd-server-command '("python" "C:/Users/zhuzh/AppData/Roaming/.emacs.d/ycmd/ycmd/"))

;; ;;ycmd-server-command is a LIST
;; (set-variable 'ycmd-server-command `( "python" ,(concat my-home-dir "\\.emacs.d\\ycmd\\ycmd")))

;; ;;ycmd-global-config is a STRING
;; ;; (set-variable 'ycmd-global-config  "C:/Users/zhuzh/AppData/Roaming/.emacs.d/ycmd/cpp/ycm/.ycm_extra_conf.py")

;; (set-variable 'ycmd-global-config (concat my-home-dir "\\.emacs.d\\ycmd\\cpp\\ycm\\.ycm_extra_conf.py"));;额外的配置

;; ;; ycmd-extra-conf-whitelist is a LIST
;; ;; (set-variable 'ycmd-extra-conf-whitelist '( "C:/Users/zhuzh/AppData/Roaming/.emacs.d/ycmdcpp/ycm"))
;; (set-variable 'ycmd-extra-conf-whitelist `(,(concat my-home-dir "\\.emacs.d\\ycmd\\cpp\\ycm")))

;; ;; (setq ycmd-python-binary-path  (concat python-executable-path "python3"))
;; (setq ycmd-python-binary-path nil)


;; (global-ycmd-mode)

;; (provide 'init-ycmd)
;; ;;; init-ycmd.el ends here
