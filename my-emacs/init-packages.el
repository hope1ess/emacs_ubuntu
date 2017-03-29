
(when (>= emacs-major-version 24)
    (require 'package)
    (package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t))

;; cl - Common Lisp Extension
(require 'cl)

;; Add Packages
(defvar my/packages '(
	              company
		      monokai-theme
		      hungry-delete;;选中空区域，一次性删除
		      swiper;;提升搜索C-s
		      counsel;;swiper配套使用
		      smartparens;;括号补全
		      popwin;;新建区域光标自移
		      ecb
		      auto-complete
		      yasnippet
		      xcscope
		      expand-region
		      iedit;;同时编辑多个区域
		      org-pomodoro
		      helm
		      ag
		      helm-ag
		      mwe-log-commands;;M-x mwe
		      js2-mode
		      web-mode
		      ycmd ;;ycmd补全

	       ) "Default packages")

(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
    (loop for pkg in my/packages
	  when (not (package-installed-p pkg)) do (return nil)
	  finally (return t)))

(unless (my/packages-installed-p)
    (message "%s" "Refreshing package database...")
    (package-refresh-contents)
    (dolist (pkg my/packages)
      (when (not (package-installed-p pkg))
	(package-install pkg))))

;; Find Executable Path on OS X
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


;;------------------------------------------------------------------------------
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))
;;使用C-n C-p选择补全


;;(global-company-mode 1);;开启全局company补全
(add-hook 'emacs-lisp-mode-hook 'company-mode)
(add-hook 'shell-mode-hook 'company-mode)
(load-theme 'monokai t);;自启monokai
(require 'hungry-delete)(global-hungry-delete-mode);;hungry安装包


(require 'smartparens-config);;
(add-hook 'emacs-lisp-mode-hook 'smartparens-mode);;smartparens绑定设置,括号补全，lisp模式中使用
(add-hook 'c-mode-hook 'smartparens-mode);;在c-mode中使用括号补全
(add-hook 'c++-mode-hook 'smartparens-mode);;在c++-mode中使用括号补全
;;(smartparens-global-mode t);;全局使用


(require 'popwin)
(popwin-mode 1)
;;popwin配置文件
;;----------------------------前端神器 --------------------------------
(require 'web-mode)
(require 'js2-mode)

(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       '(("\\.html\\'" . web-mode))
       auto-mode-alist))

(defun remove-dos-eol ()
  "Replace DOS eolns CR LF with Unix eolns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")));;删除网页中的换行符


(defun my-web-mode-indent-setup ()
  (setq web-mode-markup-indent-offset 2) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset 2)    ; web-mode, css in html file
  (setq web-mode-code-indent-offset 2)   ; web-mode, js code in html file
  )
(add-hook 'web-mode-hook 'my-web-mode-indent-setup)

;;------------------swiperpackages设置-------------------
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
;;-------------------------------------------------------
(require 'iedit)

(require 'org-pomodoro)
;;-------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------c++ IDE--------------------------------------------------------------------------------------


;;----------------------------ecb配置-------------------
(require 'ecb)
(require 'cedet);;打开cedet
;;(require 'ecb-autoloads)
;;(setq ecb-auto-activate t);;自动启动ecb
(setq ecb-auto-activate nil)

(require 'cc-mode)
(c-set-offset 'inline-open 0)
(c-set-offset 'friend '-)
(c-set-offset 'substatement-open 0)

(require 'auto-complete)

(require 'yasnippet)
(add-hook 'prog-mode-hook #'yas-minor-mode)
(add-to-list 'load-path "~/.emacs.d/elpa/yasnippet-20160801.1142/snippets")

;;自动补全  
(require 'auto-complete-config)
(ac-config-default)

(require 'xcscope)
(cscope-setup)

(defun my-c++-mode-hook ()
  (c-set-style "stroustrup"))
(add-hook 'c++-mode-hook 'my-c++-mode-hook)



;;------------------------------------------------------ide配置----------------------
(require 'dired-x);;dired-mode

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)
;;选中区域设置

(add-to-list 'package-archives
              '("melpa" . "https://melpa.org/packages/") t)



(require 'ag)
(require 'helm-ag)


(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"                 ;; personal snippets
        "/path/to/some/collection/"           ;; foo-mode and bar-mode snippet collection
        "/path/to/yasnippet/yasmate/snippets" ;; the yasmate collection
        "/path/to/yasnippet/snippets"         ;; the default collection
        ))
