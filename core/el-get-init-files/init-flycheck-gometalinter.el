(require 'flycheck-gometalinter)

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-gometalinter-setup))

;; (setq flycheck-gometalinter-executable "/home/simplex/go/bin/gometalinter")

;; skips 'vendor' directories and sets GO15VENDOREXPERIMENT=1
(setq flycheck-gometalinter-vendor t)
;; only show errors
(setq flycheck-gometalinter-errors-only nil)
;; only run fast linters
(setq flycheck-gometalinter-fast t)
;; use in tests files
(setq flycheck-gometalinter-test t)
;; disable linters
;; (setq flycheck-gometalinter-disable-linters '("vetshadow"))

;; Only enable selected linters
;; (setq flycheck-gometalinter-disable-all t)
;; (setq flycheck-gometalinter-enable-linters '("golint"))

;; Set different deadline (default: 5s)
;; (setq flycheck-gometalinter-deadline "10s")

;; Use a gometalinter configuration file (default: nil)
;; (setq flycheck-gometalinter-config "/path/to/gometalinter-config.json")
