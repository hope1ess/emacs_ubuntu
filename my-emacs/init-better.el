;;----------------------------------------UI-------------------------------
(setq initial-frame-alist (quote ((fullscreen . maximized))));;启动最大化
(tool-bar-mode -1);;消除工具栏
(menu-bar-mode -1);;消除菜单
(scroll-bar-mode -1);;消除滚动轴
(setq inhibit-splash-screen t);;关闭启动画面
(setq-default cursor-type 'bar);;更改光标样式
(setq ring-bell-function 'ignore);;关闭哗哗的提示应


;;---------------------------------------better--------------------------------
(global-hl-line-mode t);;显示当前行，高亮
(setq make-backup-files nil);;关闭备份文件
(setq auto-save-default nil);;禁止延时自动备份
(global-linum-mode t);;开启行数
(delete-selection-mode t);;输入中区域用字母代替，而不是插入其中

;;----------------------缩写补全----------------------------
(setq abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;; Shifu
					    ("1yjy" "yangjiayu")
					    ))

;;------------------------------------------------------------

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode);;括号匹配
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))));;句中显示括号


(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indent selected region."))
      (progn
	(indent-buffer)
	(message "Indent buffer.")))))

(fset 'yes-or-no-p 'y-or-n-p)

(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always);;递归删除文件


(put 'dired-find-alternate-file 'disabled nil)

;; 主动加载 Dired Mode
;; (require 'dired)
;; (defined-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)

;; 延迟加载
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))


;;dwin=do what i mean
(defun occur-dwim ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
	    (buffer-substring-no-properties
	     (region-beginning)
	     (region-end))
	  (let ((sym (thing-at-point 'symbol)))
	    (when (stringp sym)
	      (regexp-quote sym))))
	regexp-history)
  (call-interactively 'occur))
(global-set-key (kbd "M-s o") 'occur-dwim)
;;增强occur-mode


;;----------------------------------------------------------字体设置------------------------------------------------------
