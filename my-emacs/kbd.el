;;---------------------定义配置文件快捷键-----------------


(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd"<f2>") 'open-my-init-file)
;;定义init快捷键F2

(defun open-my-init-packages-file()
  (interactive)
  (find-file "~/.emacs.d/my-emacs/init-packages.el"))
(global-set-key (kbd"<f3>") 'open-my-init-packages-file)
;;定义packages快捷键F3

(defun open-yangjiayu-org()
  (interactive)
  (find-file"~/.emacs.d/yangjiayu.org"))
(global-set-key (kbd"<f4>") 'open-yangjiayu-org)




;;.emacs中设一个speedbar的快捷键  
(global-set-key [(f1)] 'speedbar-get-focus)  
;;ctrl-f4,激活,ecb  
(global-set-key [C-f1] 'ecb-activate)

;;  C-f7, 设置编译命令; f7, 保存所有文件然后编译当前窗口文件


(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "C-c C-s") 'helm-do-ag-this-file)
(global-set-key (kbd "C-x C-r") 'helm-recentf)
(global-set-key (kbd "<f8>") 'ivy-resume)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)
(global-set-key (kbd "C-c p") 'compile)
;;----------------------------------------------------------

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10);;最多储存10个文件
(global-set-key (kbd "C-x C-r") 'helm-recentf)
;;recentf设置，绑定快捷键c-x c-r

(global-set-key (kbd "M-s e") 'iedit-mode);;iedit快捷键

(global-set-key (kbd "C-c r") 'org-capture)

