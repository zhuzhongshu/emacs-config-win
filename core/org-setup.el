;;============================================================================================================
;;                                            org-mode
;;============================================================================================================
(require 'org-install)
;; (require 'org-publish)


(setq org-directory "/home/simplex/zzsweet/src/org") ;org-mode 默认目录
(setq org-default-notes-file (concat org-directory "/capture/scratch.org"))



(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode)) ; not needed since Emacs 22.2
;;=======================================================
;;org capture模板
(setq org-capture-templates '
      (("s" "scratch " entry (file+datetree org-default-notes-file)
        "* %?\n创建于： %U\n  %i\n  %a")
       ("n" "note" entry (file+headline (concat org-directory "/capture/notes.org") "笔记")
        "* %?\n创建于： %U\n  %i\n  %a")
       ("j" "jobs" entry (file+datetree (concat org-directory "/capture/jobs.org"))
        "* %?\n创建于： %U\n  %i\n  %a")
       ("t" "TODO" entry (file+datetree (concat org-directory "/capture/todo.org"))
        "*TODO %?\n创建于： %U\n  %i\n  %a":clock-in t :clock-resume t)))
;;=======================================================
;;TODO
;; 可以用中文关键词
(setq org-todo-keywords '((sequence "TODO" "DOING" "VERIFY" "|" "DONE" "DELEGATED")))

(setq org-log-done 'note);;TODO 设置成完成时，会提示输入批注
(setq org-startup-indented t)
;;=======================================================
;;日程视图
(setq org-agenda-files (list org-directory
                             "")) ;显示在日程里的文件路径目前只有包含在org-directory里头的，后续可以根据需要扩展

;;=======================================================
;;src block

(setq org-src-fontify-natively t)
(setq org-confirm-babel-evaluate nil)  

    
;;设置可执行的语言
(require 'ob-ipython)                   ;提供ipython支持
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (python . t)
   (ipython . t)
   (octave . t)
   (latex . t)
   (sql . t)
   (R . t)))
;(add-to-list 'python-shell-completion-native-disabled-interpreters "jupyter")
;;设置各语言的header
 
;; (setq org-babel-default-header-args:python
;;       '((:results . "value")
;;         (:exports . "code")))
(setq org-babel-default-header-args:sql
      '((:engine . "postgresql")
        (:cmdline . "-d zzsweet")       ;这个是必须的，否则连不上数据库
        (:dbhost . "localhost:5432")
        (:dbuser . "simplex")
        (:database . "zzsweet")))

;;=======================================================
;;org-bullet
(require 'org-bullets)
(setq org-bullets-bullet-list
  '("❤"
    "☢"
    "➤"
    "✚"
    "▼"
    "◆"
    "★"
    "◉"
    "♣"
    "✿"
    "✒"))
    ;; ◇ ✚ ✜
    ;;▪◆ ♠ ♣ ♦ ☢ ❀ ◆ ◖ ▶
    ;; ► • ★ ▸
    ;;■ □ ▢ ▣ ▤ ▥ ▦ ▧ ▨ ▩ ▪ ▫ ▬ ▭ ▮ ▯ ▰ ▱ ▲ △ ▴ ▵ ▶ ▷ ▸ ▹ ► ▻ ▼ ▽ ▾ ▿⬒ ⬓ ⬔ ⬕ ⬖ ⬗ ⬘ ⬙
    ;;◀ ◁ ◂ ◃ ◄ ◅ ◆ ◇ ◈ ◉ ◊ ○ ◌ ◍ ◎ ● ◐ ◑ ◒ ◓ ◔ ◕ ◖ ◗ ◘ ◙ ◚ ◛ ⬠ ⬡ ⬢ ⬣ ⬤
    ;;♀ ♁ ♂ ♃ ♄ ♅ ♆ ♇ ♈ ♉ ♊ ♋ ♌ ♍ ♎ ♏ ♐ ♑ ♒ ♓ ♔ ♕ ♖ ♗ ♘ ♙ ♚ ♛ ♜ ♝ ♞ ♟
    ;;✁ ✂ ✃ ✄ ✅ ✆ ✇ ✈ ✉ ✊ ✋ ✌ ✍ ✎ ✏ ✐ ✑ ✒ ✓ ✔ ✕ ✖ ✗ ✘ ✙ ✚ ✛ ✜ ✝ ✞ ✟
    ;;♠ ♡ ♢ ♣ ♤ ♥ ❤ ♦ ♧ ♨ ♩ ♪ ♫ ♬ ♭ ♮ ♯ ♰ ♱ ♲ ♳ ♴ ♵ ♶ ♷ ♸ ♹ ♺ ♻ ♼ ♽ ♾ ♿
    ;;➠ ➡ ➢ ➣ ➤ ➥ ➦ ➧ ➨ ➩ ➪ ➫ ➬ ➭ ➮ ➯ ➰ ➱ ➲ ➳ ➴ ➵ ➶ ➷ ➸ ➹ ➺ ➻ ➼ ➽ ➾ ➿

;;=======================================================
(setq org-export-initial-scope 'subtree)
;;导出latex和pdf
(require 'ox-latex)


;;自定义一个class并设置其为默认
(add-to-list 'org-latex-classes '("article-zh" "\\documentclass[a4paper,10pt]{article}
[DEFAULT-PACKAGES]
[PACKAGES]
\\setCJKfamilyfont{songti}{宋体}
\\newcommand*{\\song}{\\CJKfamily{songti}}
\\setCJKfamilyfont{heiti}{黑体}
\\newcommand*{\\hei}{\\CJKfamily{heiti}}
\\setCJKfamilyfont{kaiti}{楷体}
\\newcommand*{\\kai}{\\CJKfamily{kaiti}}
\\setCJKfamilyfont{lishu}{隶书}
\\newcommand*{\\li}{\\CJKfamily{lishu}}
\\setCJKfamilyfont{youyuan}{幼圆}
\\newcommand*{\\you}{\\CJKfamily{youyuan}}
\\setmainfont{Nimbus Roman}
\\setmonofont{Monaco}
\\definecolor{bg}{RGB}{0,43,54}
\\usemintedstyle{monokai}
\\hypersetup{hidelinks}"

                                 ("\\section{%s}" . "\\section*{%s}")
                                 ("\\subsection{%s}" . "\\subsection*{%s}")
                                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(setq org-latex-default-class "article-zh")

;;设置latex默认加入的包
(custom-set-variables
 '(org-latex-default-packages-alist
   (quote
    (("" "fontspec" t)
     ("top=1in, bottom=1in, left=1.25in, right=1.25in" "geometry" t)
     ("" "minted" t)
     ("UTF8, heading=true" "ctex" t)
     ("AUTO" "inputenc" t)
     ("" "fixltx2e" nil)
     ("" "graphicx" t)
     ("" "xcolor" t)
     ("" "bm" t)
     ("" "longtable" nil)
     ("" "float" nil)
     ("" "wrapfig" nil)
     ("" "rotating" nil)
     ("normalem" "ulem" t)
     ("" "amsmath" t)
     ("" "textcomp" t)
     ("" "marvosym" t)
     ("" "wasysym" t)
     ("" "amssymb" t)
     ("" "hyperref" nil)
     "\\tolerance=1000"))))

;;用minted实现语法高亮，需要在latexmkrc文件中设置xelatex的运行选项带有-shell-escape
;;另外还需要安装pygmentize，一个python包，可以用pip或者软件包管理器安装

(setq org-latex-listings 'minted)
(add-to-list 'org-latex-minted-langs '(python "python")) ;增加python语言支持
;;minted的选项。如bgcolor=bg就写成("bgcolor" "bg")
(setq org-latex-minted-options
      '(("bgcolor" "bg")
        ("linenos" "true")
        ("breaklines" "true")
        ("breakautoindent" "true")
        ("breakanywhere" "true")
        ("fontsize" "\\footnotesize")))

;;导出pdf是先根据上面的设置导出tex文件，然后调用latexmk自动执行编译
(setq org-latex-pdf-process '("latexmk  %f"))



;;=======================================================
;;导出html
(setq org-html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"org.css\"/>")
(setq org-html-mathjax-options
   (quote
    ((path "http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS_HTML")
     (scale "100")
     (align "center")
     (indent "2em")
     (mathml nil))))


;;另一个不用下载css文件的方式，直接用github上的css，采用solarized配色。把一下代码加入到org文件头即可
;; 浅色版本:

;; #+INFOJS_OPT: view:t toc:t ltoc:t mouse:underline buttons:0 path:http://thomasf.github.io/solarized-css/org-info.min.js
;; #+HTML_HEAD: <link rel="stylesheet" type="text/css" href="http://thomasf.github.io/solarized-css/solarized-light.min.css" />

;; 深色版本:

;; #+INFOJS_OPT: view:t toc:t ltoc:t mouse:underline buttons:0 path:http://thomasf.github.io/solarized-css/org-info.min.js
;; #+HTML_HEAD: <link rel="stylesheet" type="text/css" href="http://thomasf.github.io/solarized-css/solarized-dark.min.css" />

;;org.css文件的内容
;; html{font-family:sans-serif;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%}body{margin:0}article,aside,details,figcaption,figure,footer,header,main,menu,nav,section,summary{display:block}audio,canvas,progress,video{display:inline-block}audio:not([controls]){display:none;height:0}progress{vertical-align:baseline}[hidden],template{display:none}a{background-color:transparent;-webkit-text-decoration-skip:objects}a:active,a:hover{outline-width:0}abbr[title]{border-bottom:none;text-decoration:underline;text-decoration:underline dotted}b,strong{font-weight:inherit;font-weight:bolder}dfn{font-style:italic}h1{font-size:2em;margin:.67em 0}mark{background-color:#ff0;color:#000}small{font-size:80%}sub,sup{font-size:75%;line-height:0;position:relative;vertical-align:baseline}sub{bottom:-.25em}sup{top:-.5em}img{border-style:none}svg:not(:root){overflow:hidden}code,kbd,pre,samp{font-family:monospace,monospace;font-size:1em}figure{margin:1em 40px}hr{box-sizing:content-box;height:0;overflow:visible}button,input,select,textarea{font:inherit;margin:0}optgroup{font-weight:700}button,input{overflow:visible}button,select{text-transform:none}[type=reset],[type=submit],button,html [type=button]{-webkit-appearance:button}[type=button]::-moz-focus-inner,[type=reset]::-moz-focus-inner,[type=submit]::-moz-focus-inner,button::-moz-focus-inner{border-style:none;padding:0}[type=button]:-moz-focusring,[type=reset]:-moz-focusring,[type=submit]:-moz-focusring,button:-moz-focusring{outline:1px dotted ButtonText}fieldset{border:1px solid silver;margin:0 2px;padding:.35em .625em .75em}legend{box-sizing:border-box;color:inherit;display:table;max-width:100%;padding:0;white-space:normal}textarea{overflow:auto}[type=checkbox],[type=radio]{box-sizing:border-box;padding:0}[type=number]::-webkit-inner-spin-button,[type=number]::-webkit-outer-spin-button{height:auto}[type=search]{-webkit-appearance:textfield;outline-offset:-2px}[type=search]::-webkit-search-cancel-button,[type=search]::-webkit-search-decoration{-webkit-appearance:none}::-webkit-input-placeholder{color:inherit;opacity:.54}::-webkit-file-upload-button{-webkit-appearance:button;font:inherit}body{width:95%;margin:2%;font:normal normal normal 16px/1.6em Helvetica,sans-serif;color:#333}@media (min-width:769px){body{width:700px;margin-left:5vw}}::-moz-selection{background:#d6edff}::selection{background:#d6edff}.title{margin:auto;color:#000}.subtitle,.title{text-align:center}.subtitle{font-size:medium;font-weight:700}.abstract{margin:auto;width:80%;font-style:italic}.abstract p:last-of-type:before{content:"    ";white-space:pre}.status{font-size:90%;margin:2em auto}[class^=section-number-]{margin-right:.5em}[id^=orgheadline]{clear:both}#footnotes{font-size:90%}.footpara{display:inline;margin:.2em auto}.footdef{margin-bottom:1em}.footdef sup{padding-right:.5em}a{color:#527d9a;text-decoration:none}a:hover{color:#035;border-bottom:1px dotted}figure{padding:0;margin:0;text-align:center}img{max-width:100%;vertical-align:middle}@media (min-width:769px){img{max-width:85vw;margin:auto}}.MathJax_Display{font-size:90%;margin:0!important;width:90%!important}h1,h2,h3,h4,h5,h6{color:#a5573e;line-height:1.6em;font-family:Georgia,serif}h4,h5,h6{font-size:1em}dt{font-weight:700}table{margin:auto;border-top:2px solid;border-collapse:collapse}table,thead{border-bottom:2px solid}table td+td,table th+th{border-left:1px solid gray}table tr{border-top:1px solid #d3d3d3}td,th{padding:5px 10px;vertical-align:middle}caption.t-above{caption-side:top}caption.t-bottom{caption-side:bottom}th.org-center,th.org-left,th.org-right{text-align:center}td.org-right{text-align:right}td.org-left{text-align:left}td.org-center{text-align:center}code{padding:2px 5px;margin:auto 1px;border:1px solid #ddd;border-radius:3px;background-clip:padding-box;color:#333;font-size:80%}blockquote{margin:1em 2em;padding-left:1em;border-left:3px solid #ccc}kbd{background-color:#f7f7f7;font-size:80%;margin:0 .1em;padding:.1em .6em}.todo{background-color:red;padding:2px}.done,.todo{color:#fff;border-radius:3px;background-clip:padding-box;font-size:80%;font-family:Lucida Console,monospace}.done{background-color:green;padding:3px}.priority{color:orange;font-family:Lucida Console,monospace}#table-of-contents li{clear:both}.tag{font-family:Lucida Console,monospace;font-size:70%;font-weight:400}.tag span{padding:0 5px;float:right;margin-right:5px;border:1px solid #bbb;border-radius:3px;background-clip:padding-box;color:#333;background-color:#eee;line-height:1.6}.timestamp{color:#bebebe;font-size:90%}.timestamp-kwd{color:#5f9ea0}.org-right{margin-left:auto;margin-right:0;text-align:right}.org-left{margin-left:0;margin-right:auto;text-align:left}.org-center{margin-left:auto;margin-right:auto;text-align:center}.underline{text-decoration:underline}#postamble p,#preamble p{font-size:90%;margin:.2em}p.verse{margin-left:3%}pre{border:1px solid #ccc;box-shadow:3px 3px 3px #eee;font-family:Lucida Console,monospace;margin:1.2em;padding:8pt}pre.src{overflow:auto;padding-top:1.2em;position:relative;font-size:80%}pre.src:before{display:block;position:absolute;background-color:#ccccd0;top:0;right:0;padding:.25em .5em;border-bottom-left-radius:8px;border:0;color:#fff;font-size:80%}pre.src:hover:before{display:inline}pre.src-sh:before{content:'sh'}pre.src-bash:before{content:'bash'}pre.src-emacs-lisp:before{content:'Emacs Lisp'}pre.src-R:before{content:'R'}pre.src-org:before{content:'Org'}pre.src-c+:before{content:'C++'}pre.src-c:before{content:'C'}pre.src-html:before{content:'HTML'}.inlinetask{background:#ffc;border:2px solid gray;margin:10px;padding:10px}#org-div-home-and-up{font-size:70%;text-align:right;white-space:nowrap}.linenr{font-size:90%}.code-highlighted{background-color:#ff0}#bibliography{font-size:90%}#bibliography table{width:100%}.creator{display:block}@media (min-width:769px){.creator{display:inline;float:right}}
;;=======================================================
;;快捷键和hook
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(add-hook 'org-mode-hook (lambda ()
                           (org-bullets-mode 1)
                           (company-mode -1)       
                           (turn-on-org-cdlatex)
                           (local-set-key [tab] 'org-cycle)
                           (local-set-key "\C-c!" 'org-time-stamp)
                           (local-set-key "\C-c." 'org-time-stamp-inactive)
                           (local-set-key [(control return)] 'set-mark-command)
                           (setq truncate-lines nil)))

(add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)
(provide 'org-setup)
;;; org-setup.el ends here
