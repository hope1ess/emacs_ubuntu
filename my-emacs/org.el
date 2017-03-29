(setq org-agenda-files '("~/.emacs.d/gtd.org"));;设置默认Org Agenda文件目录
(global-set-key (kbd "C-c a") 'org-agenda);;设置Org Agenda快捷键

(require 'org)(setq org-src-fontify-natively t);;org语法高亮

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/.emacs.d/gtd.org" "学习计划")
	 "* TODO [#B] %?\n  %i\n"
	 :empty-lines 1)))
