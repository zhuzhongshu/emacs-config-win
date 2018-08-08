(require 'json-mode)




(defun browse-buffer-in-firefox ()
  (interactive )
  (setq url (concat "file://" (buffer-file-name)))
  (let* ((process-environment (browse-url-process-environment)))
    (apply 'start-process
           (concat "firefox " url) nil
           browse-url-firefox-program
           (append
            browse-url-firefox-arguments
            (list url)))))

;; 设置F10为格式化buffer[用format-all代替]
;; (define-key json-mode-map (kbd "<f10>")'json-pretty-print-buffer)

;; 设置F9为在firefox中查看json文件
(define-key json-mode-map (kbd "<f9>")'browse-buffer-in-firefox)
