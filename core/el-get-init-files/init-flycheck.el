(require 'flycheck-pos-tip)
(add-hook 'after-init-hook #'global-flycheck-mode);;自动开启fly-check mode
(with-eval-after-load 'flycheck
  (flycheck-pos-tip-mode))

;;(setq flycheck-highlighting-mode (quote lines));;高亮模式，默认是symbols
(setq flycheck-clang-language-standard "c++11");;设置clang -std="c++11"
;; (setq flycheck-clang-include-path
;;       '("/usr/local/include/Eigen"
;;         "C:/Program Files/NVIDIA GPU Computing Toolkit/CUDA/v8.0/include"))

(eval-after-load 'flycheck
  '(custom-set-variables
    '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))
(global-set-key [(control x) (up)] 'flycheck-previous-error)   ;;上一个错误
(global-set-key [(control x) (down)] 'flycheck-next-error)   ;;下一个错误

(provide 'init-flycheck)
;;; init-flycheck.el ends here
