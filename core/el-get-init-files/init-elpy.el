;;============================================================================================================
;;                                            elpy
;;============================================================================================================
(require 'elpy)
(elpy-enable);;对所有python文件都开启elpy模式，该函数自动将elpy-mode加入了python-mode-hook，还做了其他设置

(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")
;; (setq python-shell-interpreter "jupyter"
;;       python-shell-interpreter-args "console --simple-prompt"
;;       python-shell-prompt-detect-failure-warning nil)
;; (add-to-list 'python-shell-completion-native-disabled-interpreters
;;              "jupyter")


(setq elpy-shell-echo-output nil)
(setq python-executable-path "")
(setq elpy-rpc-python-command
      (concat python-executable-path "python"));;设置python后台程序为python3
(setq elpy-syntax-check-command "flake8");设置python语法检查程序为flake8

;;==========================
;;ipython5之后，默认补全方式做了更改，不再使用readline，所以elpy的终端就无法自动补全。
;;解决方式是用rlipython进行替代：https://github.com/ipython/rlipython
;;按照github说明进行设置即可，注意rlipython运行需要依赖readline，windows下可以安装pyreadline替代
;;对于linux，python应该默认带有readline模块，无需安装。但是有时候系统版本过新，可能模块导致需要的库版本不一致，
;;在导入的时候报错。处理方法是按照需要建立相应版本库的软链接即可
;;==========================

;; (setq python-shell-interpreter-args "--TerminalIPythonApp.interactive_shell_class=rlipython.TerminalInteractiveShell")

(add-to-list 'python-shell-completion-native-disabled-interpreters "ipython")
(add-to-list 'python-shell-completion-native-disabled-interpreters "jupyter")

(setq elpy-modules '(elpy-module-eldoc
                     elpy-module-company ;;补全用company-ycmd
                     elpy-module-flymake ;;语法检查用flycheck
                     elpy-module-yasnippet  ;;elpy自己提供了一些snippet
                     elpy-module-pyvenv
                     ;; elpy-module-highlight-indentation
                     elpy-module-sane-defaults))

(setq elpy-rpc-backend "jedi")
(define-key elpy-mode-map (kbd "<C-return>") nil);;执行当前语句的命令跟标记冲突，重新绑定
(define-key elpy-mode-map (kbd "C-x C-e") 'elpy-shell-send-statement-and-step);;执行当前语句
(define-key elpy-mode-map (kbd "C-c C-l") 'elpy-shell-set-local-shell);;执行当前语句
;;格式化用format-all代替了
;; (define-key elpy-mode-map (kbd "<f10>")'elpy-format-code);;格式化代码，与clang-format一致
(define-key elpy-mode-map (kbd "C-c C-f") nil)
(define-key elpy-mode-map (kbd "C-c C-k") nil)


(add-hook 'python-mode-hook 'python-docstring-mode)
(provide 'init-elpy)
;;; init-elpy.el ends here
