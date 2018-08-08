(with-eval-after-load 'flycheck
  (require 'flycheck-posframe)
  (add-hook 'flycheck-mode-hook #'flycheck-posframe-mode))
(setq flycheck-posframe-warning-prefix "\u26a0 ")
(setq flycheck-posframe-error-prefix "✕ ")



