(require 'dashboard)
(dashboard-setup-startup-hook)
(setq dashboard-items '((recents  . 8)
                        (bookmarks . 3)
                        (projects . 2)
                        (agenda . 5)))
(provide 'init-dashboard)
;;; init-dashboard.el ends here
