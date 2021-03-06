;;============================================================================================================
;;                                             appearance
;;============================================================================================================
(require 'appearance-setup)

;;============================================================================================================
;;                                             tramp
(require 'tramp)
(setq tramp-default-method "ssh")
;; usage C-x C-f /mqq@192.168.9.110:/path/to/your/file
;; tramp可以读取.ssh目录下的known_host
;;============================================================================================================
;; (setq explicit-shell-file-name "C:/msys64/usr/bin/zsh.exe") 





;;设置默认的shell程序，windows下需要安装msys2
(cond
 ((eq system-type 'windows-nt)
  (setq explicit-shell-file-name "C:/msys64/usr/bin/bash.exe"))
 ((eq system-type 'gnu/linux)
  (setq explicit-shell-file-name "/bin/zsh")))



;; msys2自带的脚本中会设置PS1的变量，但是emacs的shell并不能完全解析，所以要进行设置，把以下代码放到.bashrc中：
;; case $TERM in   
;;     xterm*)
;;         set_title='\e]0;\w\';
;         ;;    
;;     *)
;;         set_title=
;;         ;;
;; esac

;; PS1=$set_title'\n\e[32m\u@\h \e[35m$MSYSTEM\e[0m\e[33m\w\e[0m\n\$'  



(setq exec-path (append exec-path '("C:/Users/simplex/Anaconda3"))) 
  (put 'upcase-region 'disabled nil)
  (put 'downcase-region 'disabled nil)
  (setq-default indent-tabs-mode  nil)    ;空格替换tab
  (setq backup-directory-alist '(("." . "~/.saves")));设置自动备份文件放在~/.saves目录下
  (setq auto-mode-alist
        (append '(("\\.\\(h\\|hpp\\|c\\|cu\\)$" . c++-mode)) auto-mode-alist));;设置h文件和hpp文件用C++-mode，而不是默认的C-mode
  (when (fboundp 'winner-mode)
    (winner-mode)
    (windmove-default-keybindings))
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;;============================================================================================================
;;                                            global-variables
;;============================================================================================================

;;============================================================================================================
;;                                            spell-check
;;============================================================================================================
;(setq-default ispell-program-name "aspell");;设置拼写检查的软件为aspell
(setq ispell-extra-args '("--sug-mode=ultra" "--lang=en_US"))
;; (setq current-language-environment "en_US");;设置当前语言环境为en_US
(ispell-change-dictionary "english" t);;设置拼写检查的辞典为en_US:emacs24.3自动安装有ispell和辞典
(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)
;; (add-hook 'LaTeX-mode-hook 'flyspell-mode)
(global-set-key (kbd "<f7>") 'ispell-word)                      ;;F7键修改光标处的单词拼写,默认定义是M-$
(global-set-key (kbd "M-<f7>") 'flyspell-mode)          ;;开启/关闭flyspell mode
(global-set-key (kbd "C-<f7>") 'flyspell-buffer)
;;============================================================================================================
;;                                            electric-mode
;;============================================================================================================
(require 'electric)
(setq electric-indent-mode nil)                ;;开启缩进功能，用enter键也能取得C-j的效果
(setq electric-pair-mode nil);;系统本身内置的智能自动补全括号,用smartparens代替
;;============================================================================================================
;;                                            hide show mode
;;============================================================================================================
(require 'hs-setup)
;; (add-hook 'c-mode-common-hook   'hs-minor-mode)

;; (add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
;; (add-hook 'java-mode-hook       'hs-minor-mode)
;; (add-hook 'lisp-mode-hook       'hs-minor-mode)
;; (add-hook 'perl-mode-hook       'hs-minor-mode)
;; (add-hook 'sh-mode-hook         'hs-minor-mode)
;; (add-hook 'python-mode-hook 'hs-minor-mode)


;; (defun toggle-selective-display (column)
;;   (interactive "P")
;;   (set-selective-display
;;    (or column
;;        (unless selective-display
;;          (1+ (current-column))))))

;; (defun toggle-hiding (column)
;;   (interactive "P")
;;   (if hs-minor-mode
;;       (if (condition-case nil
;;               (hs-toggle-hiding)
;;             (error t))
;;           (hs-show-all))
;;     (toggle-selective-display column)))

;; (global-set-key [(control <)] 'hs-toggle-hiding)                   ;;以下四个为代码折叠快捷键
;; ;; (global-set-key [(control >)] 'hs-show-block)

;; (global-set-key [(control <)] 'hs-hide-all)
;; (global-set-key [(control >)] 'hs-show-all)
;;============================================================================================================
;;                                            hippie-expand
;;============================================================================================================

;; (setq hippie-expand-try-functions-list '(try-expand-whole-kill
;;                                          try-expand-line                    ; 补全当前行
;;                                          try-expand-dabbrev                 ; 搜索当前 buffer
;;                                          try-expand-dabbrev-visible         ; 搜索当前可见窗口
;;                                          try-expand-dabbrev-all-buffers     ; 搜索所有 buffer
;;                                          try-expand-dabbrev-from-kill       ; 从 kill-ring 中搜索
;;                                          try-complete-file-name-partially   ; 文件名部分匹配
;;                                          try-complete-file-name             ; 文件名匹配
;;                                          try-expand-all-abbrevs             ; 匹配所有缩写词
;;                                          try-expand-list))
;;============================================================================================================
;;                                              SQL
;;============================================================================================================

;; (setq sql-oracle-program "D:/app/simplex/product/11.2.0/dbhome_1/BIN/sqlplus.exe")

;;用sql-connect命令打开一个新的sql进程并将当前文件连接到该进程
;;如果想让该文件绑定到现有sql进程，则使用sql-set-sqli-buffer命令

;;配置预设sql-connect选项，可以免于在每次连接时输入账号密码信息
;; (setq sql-mysql-program "C:/Program Files/MySQL/MySQL Server 5.7/bin/mysql.exe")
;; (setq sql-mysql-options '("-C" "-f" "-t" "-n"))

;; (setq sql-postgres-program "C:/Program Files/PostgreSQL/9.5/bin/psql.exe")
;; (setq sql-postgres-options '("-a"))

(setq sql-connection-alist  
      ;; '((user-root  
      ;;    (sql-product 'mysql)  
      ;;    ;; (sql-server "mysql")  
      ;;    (sql-user "root")  
      ;;    (sql-password "zzs123456")  
      ;;    (sql-database "zzsszz")  
      ;;    ;; (sql-port 6871)
      ;;    ))
      '((dengtacj
         (sql-product 'mysql)  
         (sql-server "rds5o6p543rd9leq9tl7.mysql.rds.aliyuncs.com")
         (sql-user "dengtacj")  
         (sql-password "dengtacj2015")  
         (sql-database "db_dengta_info")  
         (sql-port 3306)
         )
        (dengtacj-2
         (sql-product 'mysql)  
         (sql-server "rdsferjo6s7315dvn71vo.mysql.rds.aliyuncs.com")
         (sql-user "dengtacj")  
         (sql-password "dengtacj2015")  
         (sql-database "db_dengta_info")  
         (sql-port 3306)
         )
        (dengtacj-test-73
         (sql-product 'mysql)  
         (sql-server "192.168.9.73")
         (sql-user "root")  
         (sql-database "db_dengta_info")  
         (sql-port 3306)
         )
        (dengtacj-test-46
         (sql-product 'mysql)  
         (sql-server "192.168.9.46")
         (sql-user "root")  
         (sql-database "db_dengta_info")  
         (sql-port 3306)
         )
        ))



(defun sql-connect-preset (name)  
  "Connect to a predefined SQL connection listed in `sql-connection-alist'"  
  (eval `(let ,(cdr (assoc name sql-connection-alist))  
           (flet ((sql-get-login (&rest what)))  
             (sql-product-interactive sql-product)))))  
      
(defun mysql-user-root ()  
  (interactive)  
  (sql-connect-preset 'user-root))  
(add-hook 'sql-mode-hook
          (lambda ()
            (local-set-key [(control x) (control e)] 'sql-send-region)
            (local-set-key [(control x) (control b)] 'sql-send-paragraph)
            (local-set-key [(control c) (control c)] 'sql-send-buffer)
            ))

;; truncate lines for long tables
(add-hook 'sql-interactive-mode-hook
    (function (lambda ()
         (setq truncate-lines t))))

(setq auto-mode-alist
      (append
       (list
        ;; insert entries for other modes here if needed.
        (cons "\.sq$" 'sql-mode))
       auto-mode-alist))
(add-hook 'sql-mode-hook 'font-lock-mode)

;;============================================================================================================
;;                                              Tex
;;============================================================================================================
(require 'tex-setup)

;;============================================================================================================
;;                                              Math
;;============================================================================================================
(if (eq system-type 'gnu/linux)
    (require 'math-setup))
;;============================================================================================================
;;                                              Org
;;============================================================================================================
(require 'org-setup)

(provide 'basic)
;;; basic.el ends here
