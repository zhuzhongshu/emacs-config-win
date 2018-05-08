(require 'shell-pop)

(setq shell-pop-window-size 50)
(setq shell-pop-window-position "full")

(defvar group-alist nil)

(defun add-to-shell-group (group-name)
  "把当前buffer加入`GROUP-NAME`中，如果当前buffer已经存在于其他group，则执行替换；否则执行插入."

  (interactive "nAdd to Shell Group: ")
  (let ((this-buffer-name (buffer-name)))
    (if (assoc  this-buffer-name group-alist)
        (setcdr (assoc this-buffer-name group-alist) group-name)
      (add-to-list 'group-alist (cons this-buffer-name  group-name)))))


;;
;;后续直接跳转了

(defun shell-pop-with-buffer-group ()
  "如果当前buffer对应没有shell group，则提示输入shell group编号，然后跳转.
如果当前buffer已经关联到shell group，则直接跳转."
  (interactive)
  (let ((this-buffer-name (buffer-name)))
    (if (string= this-buffer-name shell-pop-last-shell-buffer-name)
        (shell-pop-out)
      (if (assoc  this-buffer-name group-alist)
          (shell-pop (cdr (assoc  this-buffer-name group-alist)))
        (let ((shell-group-num (read-minibuffer "Add to Shell Group: " "1")))
          (add-to-shell-group shell-group-num)
          (shell-pop shell-group-num))))))

(global-set-key (kbd "<f12>") 'shell-pop-with-buffer-group)






;; (defun buffer-shell-pop-2 ()
;;   (interactive)
;;   (let ((this-buffer-name (buffer-name)))
;;     (if (string= this-buffer-name shell-pop-last-shell-buffer-name)
;;         (shell-pop-out)
;;       (if (assoc  this-buffer-name group-alist)
;;           (shell-pop (cdr (assoc  this-buffer-name group-alist)))
;;         (shell-pop 1)))))
