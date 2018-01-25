;; 代码折叠主要通过hs-minor-mode 和outline-minor-mode（配合outline-magic）实现
;; 这两个模式各自有一些优缺点，目前只能配合着用。默认是使用hs-minor-mode，对于
;; 实现了outline相关支持的模式，采用outline mode，如c++、python、tex模式
;; hs-minor-mode支持的模式比较多，但是暂时没想到cycle的实现方式
;; outline-magic提供了cycle函数，可以方便的切换折叠与展开模式，但是支持的模式比较少
;; 有些模式内置了相关支持，，但是其他模式木有，需要自己实现相关函数【不会】

;;============================================================================================================
;;                                            hs-minor-mode
;;============================================================================================================

(add-hook 'java-mode-hook       'hs-minor-mode)
(add-hook 'js-mode-hook       'hs-minor-mode)
(add-hook 'json-mode-hook       'hs-minor-mode)
(add-hook 'lisp-mode-hook       'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'perl-mode-hook       'hs-minor-mode)
(add-hook 'sh-mode-hook         'hs-minor-mode)


(defvar hs-hide-all nil "Current state of hideshow for toggling all.")
  ;;;###autoload
(defun hs-toggle-hiding-all () "Toggle hideshow all."
       (interactive)
       (setq hs-hide-all (not hs-hide-all))
       (if hs-hide-all
           (hs-hide-all)
         (hs-show-all)))


;; (setq hs-allow-nesting t)
;; (setq hs-hide-all-non-comment-function nil)


;; (global-set-key [(control <)] 'hs-toggle-hiding)
;; (global-set-key [(control >)] 'hs-toggle-hiding-all)

(global-set-key  [(control <)] 'hs-toggle-hiding)
(global-set-key  [(control >)] 'hs-toggle-hiding-all)




;;============================================================================================================
;;                                            outline-minor-mode
;;============================================================================================================
(require 'outline-magic)

(add-hook 'c-mode-common-hook   'outline-minor-mode)
(add-hook 'python-mode-hook     'outline-minor-mode)
(add-hook 'LaTeX-mode-hook        'outline-minor-mode)

;; 
;; (add-hook 'json-mode-hook
;;             (lambda ()
;;               (set (make-local-variable 'outline-regexp) ".*[{]+")
;;               (set (make-local-variable 'outline-heading-end-regexp) "}")
;;               (set (make-local-variable 'outline-level) 'c-outline-level)))

;; 有些提供了outline支持的就覆盖掉hs-toggle-hiding的键绑定
(define-key python-mode-map [(control <)] 'outline-cycle)
(define-key c-mode-map [(control <)] 'outline-cycle)
(define-key c++-mode-map [(control <)] 'outline-cycle)


(provide 'hs-setup)
