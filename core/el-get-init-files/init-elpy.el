;;============================================================================================================
;;                                            elpy
;;============================================================================================================
(elpy-enable);;对所有python文件都开启elpy模式，该函数自动将elpy-mode加入了python-mode-hook，还做了其他设置
(elpy-use-ipython)
(setq python-executable-path "")
(setq elpy-rpc-python-command
      (concat python-executable-path "python"));;设置python后台程序为python3,python-executable-path在ein里面设置
(setq elpy-syntax-check-command "flake8");设置python语法检查程序为flake8

(setq python-shell-interpreter-args "--simple-prompt --pprint")
(add-to-list 'python-shell-completion-native-disabled-interpreters "ipython")
(add-to-list 'python-shell-completion-native-disabled-interpreters "jupyter")

(setq elpy-modules '(elpy-module-eldoc
                      elpy-module-company ;;补全用company-ycmd
                     elpy-module-flymake ;;语法检查用flycheck
                     elpy-module-yasnippet  ;;elpy自己提供了一些snippet
                     elpy-module-pyvenv
                     elpy-module-highlight-indentation
                     elpy-module-sane-defaults))

(setq elpy-rpc-backend "jedi")
(define-key elpy-mode-map (kbd "<C-return>") nil);;执行当前语句的命令跟标记冲突，重新绑定
(define-key elpy-mode-map (kbd "C-x C-e") 'elpy-shell-send-current-statement);;执行当前语句
(define-key elpy-mode-map (kbd "<f10>")'elpy-format-code);;格式化代码，与clang-format一致
(define-key elpy-mode-map (kbd "C-c C-f") nil)

(provide 'init-elpy)
;;; init-elpy.el ends here
