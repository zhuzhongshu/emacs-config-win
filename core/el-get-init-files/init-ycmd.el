(require 'ycmd)

(setq ycmd-server-home (concat my-home-dir "/.emacs.d/ycmd/ycmd/"))
;; (set-variable 'ycmd-server-command '("python" "C:/Users/zhuzh/AppData/Roaming/.emacs.d/ycmd/ycmd/"))

;;ycmd-server-command is a LIST
(set-variable 'ycmd-server-command `( "python" ,(concat my-home-dir "/.emacs.d/ycmd/ycmd")))

;;ycmd-global-config is a STRING
;;全局的额外设置，对每个项目都管用
(set-variable 'ycmd-global-config (concat my-home-dir "/.emacs.d/useful_scripts/.ycm_extra_conf.py"))

;; ycmd-extra-conf-whitelist is a LIST
;; (set-variable 'ycmd-extra-conf-whitelist '( "C:/Users/zhuzh/AppData/Roaming/.emacs.d/ycmdcpp/ycm"))
(set-variable 'ycmd-extra-conf-whitelist `(,(concat my-home-dir "/.emacs.d/ycmd/cpp/ycm")))

;; (setq ycmd-python-binary-path  (concat python-executable-path "python3"))

(global-ycmd-mode)


(require 'flycheck-ycmd)
(flycheck-ycmd-setup)

(provide 'init-ycmd)
;;; init-ycmd.el ends here
