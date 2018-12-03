
(require 'lsp-mode)


;;++++++++++++++++++++lsp-ui++++++++++++++++++++
(require 'lsp-ui)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)
(add-hook 'c-mode-common-hook 'flycheck-mode)

(define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
(define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
(setq lsp-ui-sideline-show-code-actions nil)
(setq lsp-ui-sideline-show-flycheck nil)

;;++++++++++++++++++++lsp-ui-doc++++++++++++++++++++
(setq lsp-ui-doc-header t)
(setq lsp-ui-doc-max-width 100)
(setq lsp-ui-doc-max-height 50)
;; (setq lsp-ui-doc-position 'top)


(require 'lsp-imenu)
(add-hook 'lsp-after-open-hook 'lsp-enable-imenu)

(require 'lsp-ui-peek)
;; (add-hook 'lsp-after-open-hook 'lsp-enable-peek)

;;++++++++++++++++++++company-lsp++++++++++++++++++++
(require 'company-lsp)
(push 'company-lsp company-backends)
(setq company-lsp-enable-recompletion t)


;;++++++++++++++++++++cquery++++++++++++++++++++
;;cquery编译时最好用系统安装的clang，免得版本冲突，在CMakeLists中把选项SYSTEM_CLANG改成ON即可
;;现在arch软件源里有cquery了
(require 'cquery)
(setq cquery-executable "/usr/bin/cquery")
;; (setq cquery-extra-init-params '(:index (:comments 2) :cacheFormat "msgpack"))
(setq company-transformers nil company-lsp-async t company-lsp-cache-candidates nil)


(setq cquery-extra-init-params '(:completion (:detailedLabel t)))
(setq cquery-sem-highlight-method 'fontlock)


(defun cquery//enable ()
  (condition-case nil
      (lsp-cquery-enable)
    (user-error nil)))
(add-hook 'c-mode-common-hook 'cquery//enable)
(add-hook 'c-mode-common-hook
          (lambda ()
            (set (make-local-variable 'company-backends)  (quote (company-lsp
                                                                  company-yasnippet
                                                                  company-files)))))


;; Also see lsp-project-whitelist lsp-project-blacklist cquery-root-matchers
;; alternatively, (setq cquery-sem-highlight-method 'overlay)


;;++++++++++++++++++++python++++++++++++++++++++
;;elpy提供的已经比较全面了，暂时用不到lsp


;; (require 'lsp-common)
;; ;; (lsp-define-stdio-client lsp-python "python"
;; ;; 			 (lsp-make-traverser #'(lambda (dir)
;; ;; 						 (directory-files
;; ;; 						  dir
;; ;; 						  nil
;; ;; 						  "setup.py")))
;; ;; 			 '("pyls"))

;; (lsp-define-stdio-client lsp-python "python"
;;                          (lambda () default-directory)
;; 			 '("pyls"))

;; (add-hook 'python-mode-hook #'lsp-python-enable)

;; (add-hook 'python-mode-hook
;;           (lambda ()
;;             (set (make-local-variable 'company-backends)  (quote (company-lsp
;;                                                                   company-yasnippet
;;                                                                   company-files)))))


;;++++++++++++++++++++go++++++++++++++++++++
(defgroup lsp-go nil
  "lsp-go settings"
  :group 'tools)


(defcustom lsp-go-executable-path  "/home/simplex/go/bin/go-langserver"
  "Path to the go-langserver executable."
  :type 'string
  :group 'lsp-go)

(lsp-define-stdio-client lsp-go "go" #'(lambda () default-directory)
			 `(,lsp-go-executable-path "-mode=stdio" "-gocodecompletion","-format-tool=gofmt")
			 :ignore-regexps
			 '("^langserver-go: reading on stdin, writing on stdout$"))

(add-hook 'go-mode-hook #'lsp-go-enable)
(add-hook 'go-mode-hook
          (lambda ()
            (set (make-local-variable 'company-backends)  (quote (company-lsp
                                                                  company-yasnippet
                                                                  company-files)))
            (setq lsp-ui-flycheck-enable nil)
            (setq flycheck-checker 'gometalinter)
            (setq-default flycheck-disabled-checkers '(lsp-ui))
            ))
