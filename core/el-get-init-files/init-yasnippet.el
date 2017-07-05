(require 'yasnippet)
(require 'smartparens)
(yas-global-mode 1)
;; 取消yasnippet对tab的占用
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-keymap (kbd "<tab>") nil)

;; 修正yas filed中嵌套有sp overlay（即嵌套括号或引号）时，yas-keymap被sp-keymap覆盖失效，从而M-tab恢复绑定到yas-expand而
;; 不能跳转到下一个field中的问题。windows下alt-tab被占用，改用alt-enter
(cond
 ((eq system-type 'windows-nt)
  (define-key yas-minor-mode-map (kbd "M-\`") 'yas-expand)
  (define-key yas-keymap (kbd "M-\`") 'yas-next-field-or-maybe-expand))
 ((eq system-type 'gnu/linux)
  (define-key yas-minor-mode-map (kbd "M-<tab>") 'yas-expand)
  (define-key yas-keymap (kbd "M-<tab>") 'yas-next-field-or-maybe-expand)))

(cond
 ((eq system-type 'windows-nt)
  (setq yas-snippet-dirs (concat my-home-dir "\\.emacs.d\\snippets")))
 ((eq system-type 'gnu/linux)
  (setq yas-snippet-dirs "~/.emacs.d/snippets")))

(provide 'init-yasnippet)
;;; init-yasnippet.el ends here
