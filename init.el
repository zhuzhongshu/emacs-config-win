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
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
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
       atom-one-dark-theme
       ;; bookmark+
       cuda-mode
       comment-dwim-2
       cmake-mode
       cypher-mode
       dash
       dashboard
       ;; dired+
       dockerfile-mode
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
       ;; ycmd
       ;; company-ycmd
       ;; ein
       elpy
       ;; eglot
       ;; find-file-in-project
       flx-ido
       flycheck
       ;; flycheck-pos-tip
       flycheck-posframe
       ;; flycheck-ycmd
       ;; flycheck-irony
       format-all
       fuzzy
       ggtags
       gnuplot-mode
       go-mode
       flycheck-gometalinter
       ;helm-core
       helm
       helm-ag
       ;; helm-cscope
       helm-dash
       ;; helm-gtags
       ;;helm-bibtex
       helm-swoop
       ;; helm-tramp
       highlight-indent-guides
       htmlize
       hydra
       ido-vertical-mode
       imenu-list
       ;; irony
       ;; irony-eldoc
       ;; company-irony
       json-mode
       ;; jsonrpc
       langtool
       lsp-mode
       company-lsp
       ;; lsp-python
       lsp-ui
       cquery
       magit
       modern-cpp-font-lock       
       multi-term
       org-bullets
       org-download
       ob-ipython
       ;; origami
       ;; outshine
       outline-magic
       popup
       popwin
       ;; powerline
       python-docstring
       ;; projectile
       ;; helm-projectile
       rainbow-delimiters
       ;; ranger
       shell-pop
       smartparens
       smex
       sqlup-mode
       swiper
       sphinx-doc
       vimish-fold
       vmd-mode
       web-mode
       window-numbering
       ;; spaceline
       ;; xcscope
       ;yafolding
       yaml-mode
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
 '(company-begin-commands nil)
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
 '(helm-imenu-delimiter "|")
 '(helm-locate-fuzzy-match t)
 '(lsp-ui-sideline-show-flycheck nil)
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
     "\\tolerance=1000")))
 '(package-selected-packages
   (quote
    (jsonrpc yaml-mode window-numbering web-mode vmd-mode vimish-fold swiper sqlup-mode sphinx-doc spaceline smex smartparens shell-pop request-deferred rainbow-delimiters python-docstring popwin package outline-magic org-download org-bullets ob-ipython multi-term modern-cpp-font-lock magit lsp-ui langtool json-mode imenu-list ido-vertical-mode hydra htmlize highlight-indent-guides helm-swoop helm-dash helm-ag go-mode gnuplot-mode ggtags fuzzy format-all flycheck-posframe flycheck-gometalinter flx-ido eval-sexp-fu elpy dockerfile-mode dashboard cython-mode cypher-mode cuda-mode cquery company-quickhelp company-lsp comment-dwim-2 cnfonts cmake-mode clang-format avy auto-compile auctex-latexmk atom-one-dark-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
