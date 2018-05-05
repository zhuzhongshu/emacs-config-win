;;============================================================================================================
;;                                            multi-term
;;============================================================================================================
(require 'multi-term)
(setq multi-term-program "/bin/zsh")
(add-hook 'term-mode-hook
          (lambda ()
            (company-mode -1)))

(defun set-term-bind-key-alist (keys)
  (dolist (key keys)
    (if (assoc (car key) term-bind-key-alist)
        (setcdr (assoc (car key) term-bind-key-alist) (cdr key))
      (add-to-list 'term-bind-key-alist key)
      )))

(setq keys (list '("M-d" . kill-word)
                 '("C-f" . forward-char)
                 '("C-f" . forward-char)
                 '("C-b" . backward-char)
                 '( "C-p" . previous-line)
                 '( "C-n" . next-line)
                 '( "M-a" . backward-sentence)
                 '( "M-f" . forward-word)
                 '( "M-b" . backward-word)
                 '( "C-v" . scroll-up-command)
                 '( "C-e" . move-end-of-line)
                 ;; '( "C-a" . move-beginning-of-line)
                 ;; '( "C-k" . kill-line)
                 '( "M-e" . forward-sentence)
                 '( "M-v" . scroll-down-command)
                 '("C-l" . clear-shell)))

(set-term-bind-key-alist keys)



(multi-term-keystroke-setup)
(provide 'init-multi-term)
;;; init-multi-term.el ends here
