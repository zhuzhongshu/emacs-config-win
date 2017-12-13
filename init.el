;;; package --- Summary

;;; Commentary:

;;; code:

;;; This file bootstraps the configuration, which is divided into
;;; a number of other files.


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;;获取主目录变量，有些配置需要该变量
(setq my-home-dir (getenv "HOME"))
;;中文镜像地址
;; (setq package-archives '(("org" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
;;                          ("gnu"   . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
;;                          ("melpa" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
;;                          ("marmalade" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/marmalade/")))

(setq package-archives '(("org" . "https://elpa.emacs-china.org/org/")
                         ("gnu"   . "https://elpa.emacs-china.org/gnu/")
                         ("melpa" . "https://elpa.emacs-china.org/melpa/")
                         ("marmalade" . "https://elpa.emacs-china.org/marmalade/")))

(package-initialize)

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

;;   (el-get-elpa-build-local-recipes)
;;   (el-get-emacswiki-build-local-recipes))
;; (setq el-get-git-shallow-clone t)
;; (setq el-get-user-package-directory "~/.emacs.d/core/el-get-init-files/")
;; (require 'package)

;;用这个得到已安装的package列表
;; (dolist (package-name my-packages)
;;   (insert (concat package-name "\n")))



(setq required-packages
      '(pos-tip
       auctex-latexmk
       auto-compile
       async
       bookmark+
       cuda-mode
       comment-dwim-2
       cmake-mode
       dash
       dashboard
       ;; dired+
       eval-sexp-fu
       s
       f
       deferred
       request-deferred
       let-alist
       avy
       cnfonts
       clang-format
       company
       company-quickhelp
       cython-mode
       ycmd
       company-ycmd
       ;; ein
       elpy
       find-file-in-project
       flx-ido
       flycheck
       flycheck-pos-tip
       flycheck-ycmd
       ;; flycheck-irony
       fuzzy
       ;;ggtags
       gnuplot-mode
       ;helm-core
       helm
       helm-ag
       helm-cscope
       helm-dash
       helm-gtags
       ;;helm-bibtex
       helm-swoop
       helm-tramp
       htmlize
       hydra
       ido-vertical-mode
       irony
       json-mode
       company-irony
       langtool
       ;; lsp-mode
       ;; company-lsp
       ;; lsp-python
       magit
       multi-term
       org-bullets
       org-download
       ob-ipython
       ;; origami
       popup
       popwin
       ;; powerline
       python-docstring
       rainbow-delimiters
       ;; ranger
       smartparens
       smex
       sqlup-mode
       swiper
       sphinx-doc
       vimish-fold
       window-numbering
       ;; spaceline
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
;; (spaceline-spacemacs-theme)
(desktop-save-mode -1)
(provide 'init)
;;; init.el ends here
