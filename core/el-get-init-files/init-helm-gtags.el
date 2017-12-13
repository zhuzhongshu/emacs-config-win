;;=========helm-gtags=========
;;; Enable helm-gtags-mode
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)

;; customize
(custom-set-variables
 '(helm-gtags-path-style 'relative)
 '(helm-gtags-ignore-case t)
 '(helm-gtags-auto-update t))
;; key bindings
(eval-after-load "helm-gtags"
  '(progn
     (define-key helm-gtags-mode-map (kbd "\C-cgt") 'helm-gtags-find-tag)
     (define-key helm-gtags-mode-map (kbd "\C-cgr") 'helm-gtags-find-rtag)
     (define-key helm-gtags-mode-map (kbd "\C-cgs") 'helm-gtags-find-symbol)
     (define-key helm-gtags-mode-map (kbd "\C-cgp") 'helm-gtags-parse-file)
     (define-key helm-gtags-mode-map (kbd "\C-cg<") 'helm-gtags-previous-history)
     (define-key helm-gtags-mode-map (kbd "\C-cg>") 'helm-gtags-next-history)
     (define-key helm-gtags-mode-map (kbd "\C-cg,") 'helm-gtags-pop-stack)))
