;;; package --- Summary

;;; Commentary:

;;; code:

;;; This file bootstraps the configuration, which is divided into
;;; a number of other files.


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)


;;中文镜像地址
(setq package-archives '(("org" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
                         ("gnu"   . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
                         ("marmalade" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/marmalade/")))


(let ((minver "23.3"))
  (when (version<= emacs-version "23.1")
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))
(when (version<= emacs-version "24")
  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))



;;设置el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(add-to-list 'load-path (expand-file-name "el-get/el-get" user-emacs-directory))




(unless (require 'el-get nil 'noerror)
  ;;只有el-get没有安装的时候才会执行函数体
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch
          ;; do not build recipes from emacswiki due to poor quality and documentation
          el-get-install-skip-emacswiki-recipes)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  
;; 从melpa下载的软件包里有个pkg.el，会说明与其他包的依赖关系。但是问题是这个依赖关系包含版本号，所以
;; 当依赖关系中的某个包不是从melpa上下载的时候，就会报错说找不到package xx-0.0之类，所以现在只从melpa上下载软件包。
;; el-get包里自带的有一堆recipe，但是很多源都不是melpa的，经常出问题，所以每次安装el-get的时候执行el-get-elpa-build-local-recipes
;; 自动下载melpa的recipes到本地目录。似乎本地目录的优先级更高，可以保证软件包都从melpa上下载
  (el-get-elpa-build-local-recipes "~/.emacs.d/core/el-get-user-recipes/")
 )

(setq el-get-git-shallow-clone t)
(setq el-get-allow-insecure t)

;;自定义的初始化文件
(setq el-get-user-package-directory "~/.emacs.d/core/el-get-init-files/")
(add-to-list 'el-get-recipe-path "~/.emacs.d/core/el-get-user-recipes/")


;; (unless (require 'el-get nil 'noerror)
;;   (with-current-buffer
;;       (url-retrieve-synchronously
;;        "http://raw.github.com/dimitri/el-get/master/el-get-install.el")
;;     (let (el-get-master-branch
;;           ;; do not build recipes from emacswiki due to poor quality and
;;           ;; documentation
;;           el-get-install-skip-emacswiki-recipes)
;;       (goto-char (point-max))
;;       (eval-print-last-sexp)))
;;   ;; build melpa packages for el-get
;;   (setq package-archives '(("melpa" . "http://melpa.org/packages/")
;;                            ("gnu" . "http://elpa.gnu.org/packages/")))
;;   (el-get-elpa-build-local-recipes)
;;   (el-get-emacswiki-build-local-recipes))
;; (setq el-get-git-shallow-clone t)
;; (setq el-get-user-package-directory "~/.emacs.d/core/el-get-init-files/")
;; (require 'package)

;;用这个得到已安装的package列表
;; (dolist (package-name my-packages)
;;   (insert (concat package-name "\n")))


;package之间的顺序很重要，有些包可能依赖其他的包
(setq required-packages
      '(pos-tip
       auctex-latexmk
       auto-compile
       async
       comment-dwim-2
       dash
       s
       f
       deferred
       request-deferred
       let-alist
       avy
       chinese-fonts-setup
       company
       company-quickhelp
       ycmd
       company-ycmd
       company-jedi
       ein
       elpy
       find-file-in-project
       flx-ido
       flycheck
       flycheck-pos-tip
       flycheck-ycmd
       fuzzy
       gnuplot-mode
       helm-core
       helm
       helm-ag
       helm-cscope
       helm-dash
       helm-gtags
       ;;helm-bibtex
       helm-swoop
       htmlize
       ido-vertical-mode
       irony-mode
       company-irony
       langtool
       multi-term
       org-bullets
       ob-ipython
       popup
       popwin
       python-docstring
       rainbow-delimiters
       smartparens
       smex
       sqlup-mode
       swiper
       window-numbering
       spaceline
       xcscope
yasnippet))
(el-get 'sync required-packages)



;;载入自己的配置文件
(add-to-list 'load-path "~/.emacs.d/core/")
(require 'basic)
(require 'keybindings)
(require 'functions)


;;开启emacs服务器功能
(server-start)
;;加载spaceline
(spaceline-spacemacs-theme)

;; (provide 'init)
;;; init.el ends here

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-auto-complete nil)
 '(company-auto-complete-chars (quote ignore))
 '(company-backends
   (quote
    (company-capf company-ispell company-yasnippet company-files company-elisp company-css company-eclim company-semantic company-xcode company-ropemacs company-cmake company-bbdb
                  (company-dabbrev-code company-gtags company-etags company-keywords)
                  company-oddmuse company-dabbrev)))
 '(company-frontends
   (quote
    (company-pseudo-tooltip-unless-just-one-frontend company-preview-if-just-one-frontend company-quickhelp-frontend)))
 '(company-idle-delay 0)
 '(company-minimum-prefix-length 999)
 '(company-require-match t)
 '(company-show-numbers t)
 '(company-tooltip-align-annotations t)
 '(company-tooltip-minimum-width 50)
 '(company-tooltip-offset-display (quote scrollbar))
 '(flycheck-display-errors-function (function flycheck-pos-tip-error-messages))
 '(helm-M-x-fuzzy-match t)
 '(helm-boring-buffer-regexp-list
   (quote
    ("\\` " "\\*helm" "\\*helm-mode" "\\*Echo Area" "\\*Minibuf" "\\*Messages")))
 '(helm-buffer-max-length 30)
 '(helm-buffers-fuzzy-matching t)
 '(helm-completing-read-handlers-alist
   (quote
    ((describe-function . helm-completing-read-symbols)
     (describe-variable . helm-completing-read-symbols)
     (debug-on-entry . helm-completing-read-symbols)
     (find-function . helm-completing-read-symbols)
     (find-tag . helm-completing-read-with-cands-in-buffer)
     (ffap-alternate-file)
     (tmm-menubar)
     (find-file . ido))))
 '(helm-display-source-at-screen-top nil)
 '(helm-gtags-auto-update t)
 '(helm-gtags-ignore-case t)
 '(helm-gtags-path-style (quote relative))
 '(helm-locate-fuzzy-match t)
 '(org-agenda-files
   (quote
    ("d:/Documents/LinuxHome/zzsweet/src/org/notes/RNN与LSTM.org" "d:/Documents/LinuxHome/zzsweet/src/org/notes/Tensorflow笔记.org" "d:/Documents/LinuxHome/zzsweet/src/org/notes/org-mode小技巧.org" "d:/Documents/LinuxHome/zzsweet/src/org/notes/pythonLibrary.org" "d:/Documents/LinuxHome/zzsweet/src/org/notes/sql.org" "d:/Documents/LinuxHome/zzsweet/src/org/notes/todo.org" "d:/Documents/LinuxHome/zzsweet/src/org/notes/图论.org" "d:/Documents/LinuxHome/zzsweet/src/org/notes/机器学习选股.org" "d:/Documents/LinuxHome/zzsweet/src/org/notes/高斯过程与贝叶斯方法.org")))
 '(org-latex-default-packages-alist
   (quote
    (("" "fontspec" t)
     ("top=1in, bottom=1in, left=1.25in, right=1.25in" "geometry" t)
     ("" "minted" t)
     ("UTF8, heading=true" "ctex" t)
     ("AUTO" "inputenc" t)
     ("" "fixltx2e" nil)
     ("" "graphicx" t)
     ("" "xcolor" t)
     ("" "bm" t)
     ("" "longtable" nil)
     ("" "float" nil)
     ("" "wrapfig" nil)
     ("" "rotating" nil)
     ("normalem" "ulem" t)
     ("" "amsmath" t)
     ("" "textcomp" t)
     ("" "marvosym" t)
     ("" "wasysym" t)
     ("" "amssymb" t)
     ("" "hyperref" nil)
     "\\tolerance=1000"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
