
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(add-hook 'yaml-mode-hook 'highlight-indent-guides-mode)

(setq highlight-indent-guides-method 'character)

(setq highlight-indent-guides-responsive 'top)

(setq highlight-indent-guides-delay 0.5)

;;默认的是9474，对应中文字符|，比较宽，可能造成对齐不准，这里改成英文的|
(setq highlight-indent-guides-character 124)
