(require 'hydra)

(global-set-key (kbd "C-x C-x ") nil)
(defhydra hydra-replace (:color blue :hint nil)
"
^^^^^^^^-----------------------------------------------------------------
_r_: query replace
_R_: query replace regexp
"
  ("r" query-replace )
  ("R" query-replace-regexp )
  ("q" nil "quit"))
  
(global-set-key (kbd "C-x C-x r") 'hydra-replace/body)

(defhydra hydra-buffer (:color blue :hint nil)
"
^^^^^^^^-----------------------------------------------------------------
_r_: revert buffer
_R_: change coding system
_c_: change coding system and save
"
  ("r" revert-buffer )
  ("R" revert-buffer-with-coding-system )
  ("c" convert-coding-system-and-save )
  ("q" nil "quit"))
(global-set-key (kbd "C-x C-x b") 'hydra-buffer/body)


(defhydra hydra-edit (:color blue :hint nil)
  ("[" backward-page  :color red)
  ("]" forward-page :color red)
  ;; ("n" scroll-up-command :color red)
  ;; ("p" scroll-down-command :color red)
  ("k" kill-line  :color red)
  ("d" delete-char :color red)
  ("n" next-line :color red)
  ("p" previous-line :color red)
  ("a" move-beginning-of-line)
  ("e" move-end-of-line)  
  ("f" forward-char :color red)
  ("b" backward-char :color red)
  ("RET" set-mark-command :color red)
  ("w" kill-ring-save :color red)
  ("y" yank :color red)
  ("q" nil "quit"))

(global-set-key (kbd "C-x C-x e") 'hydra-edit/body)
(defhydra hydra-flycheck (:color blue :hint nil)
"
_s_: select checker     
_t_: toggle on/off      
"
  ("s" flycheck-select-checker :exit t)
  ("t" flycheck-mode :exit t)
  ("q" nil "quit"))
(global-set-key (kbd "C-x C-x f") 'hydra-flycheck/body)



(defhydra hydra-comint (:color blue :hint nil)
"
Quickly open different shells
^^^^^^^^-----------------------------------------------------------------
_p_: python shell
_t_: multi term
_e_: eshell
_o_: octave
"
  ("p" elpy-shell-switch-to-shell )
  ("t" zzs-multi-term )
  ("e" eshell)
  ("o" zzs-octave)
  ("q" nil "quit"))
  
(global-set-key (kbd "C-x C-x t") 'hydra-comint/body)


(defhydra hydra-helm (:color blue
                             :hint nil)
"
_r_: show register
"
  ("r" helm-register  :exit t)
  ("q" nil "quit"))
(global-set-key (kbd "C-x C-x h") 'hydra-helm/body)



(defun org-agenda-cts ()
  (and (eq major-mode 'org-agenda-mode)
       (let ((args (get-text-property
                    (min (1- (point-max)) (point))
                    'org-last-args)))
         (nth 2 args))))

(defhydra hydra-org-agenda-view (:hint none)
  "
_d_: ?d? day        _g_: time grid=?g?  _a_: arch-trees
_w_: ?w? week       _[_: inactive       _A_: arch-files
_t_: ?t? fortnight  _f_: follow=?f?     _r_: clock report=?r?
_m_: ?m? month      _e_: entry text=?e? _D_: include diary=?D?
_y_: ?y? year       _q_: quit           _L__l__c_: log = ?l?"
  ("SPC" org-agenda-reset-view)
  ("d" org-agenda-day-view (if (eq 'day (org-agenda-cts)) "[x]" "[ ]"))
  ("w" org-agenda-week-view (if (eq 'week (org-agenda-cts)) "[x]" "[ ]"))
  ("t" org-agenda-fortnight-view (if (eq 'fortnight (org-agenda-cts)) "[x]" "[ ]"))
  ("m" org-agenda-month-view (if (eq 'month (org-agenda-cts)) "[x]" "[ ]"))
  ("y" org-agenda-year-view (if (eq 'year (org-agenda-cts)) "[x]" "[ ]"))
  ("l" org-agenda-log-mode (format "% -3S" org-agenda-show-log))
  ("L" (org-agenda-log-mode '(4)))
  ("c" (org-agenda-log-mode 'clockcheck))
  ("f" org-agenda-follow-mode (format "% -3S" org-agenda-follow-mode))
  ("a" org-agenda-archives-mode)
  ("A" (org-agenda-archives-mode 'files))
  ("r" org-agenda-clockreport-mode (format "% -3S" org-agenda-clockreport-mode))
  ("e" org-agenda-entry-text-mode (format "% -3S" org-agenda-entry-text-mode))
  ("g" org-agenda-toggle-time-grid (format "% -3S" org-agenda-use-time-grid))
  ("D" org-agenda-toggle-diary (format "% -3S" org-agenda-include-diary))
  ("!" org-agenda-toggle-deadlines)
  ("[" (let ((org-agenda-include-inactive-timestamps t))
         (org-agenda-check-type t 'timeline 'agenda)
         (org-agenda-redo)
         (message "Display now includes inactive timestamps as well")))
  ("q" (message "Abort") :exit t))

;; Recommended binding:
(define-key org-agenda-mode-map "v" 'hydra-org-agenda-view/body)




(defhydra hydra-ediff (:color blue :hint nil)
  "
^Buffers           Files           VC                     Ediff regions
----------------------------------------------------------------------
_b_uffers           _f_iles (_=_)       _r_evisions              _l_inewise
_B_uffers (3-way)   _F_iles (3-way)                          _w_ordwise
                  _c_urrent file
"
  ("b" ediff-buffers)
  ("B" ediff-buffers3)
  ("=" ediff-files)
  ("f" ediff-files)
  ("F" ediff-files3)
  ("c" ediff-current-file)
  ("r" ediff-revision)
  ("l" ediff-regions-linewise)
  ("w" ediff-regions-wordwise))

(global-set-key (kbd "C-x C-x d") 'hydra-ediff/body)




(defhydra hydra-ggtags (:color blue :hint nil)
"

^Tags^               ^Find^             ^Actions^          
^^^^^^^^-----------------------------------------------------------------
_c_: create          _=_: dwim          _p_: previous mark 
_u_: update          _d_: definition    _n_: next mark     
_D_: delete          _r_: reference     ^ ^
^ ^                  _f_: file          ^ ^       
^ ^                  _o_: other         ^ ^
"
  ("c" ggtags-create-tags)
  ("u" ggtags-update-tags)
  ("D" ggtags-delete-tags)  
  ("=" ggtags-find-tag-dwim)
  ("d" ggtags-find-definition)
  ("r" ggtags-find-reference)
  ("f" ggtags-find-file)
  ("o" ggtags-find-other-symbol)
  ("p" ggtags-prev-mark)
  ("n" ggtags-next-mark)
  
  )

(global-set-key (kbd "C-x C-x g") 'hydra-ggtags/body)

