(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(custom-enabled-themes '(tsdh-dark))
 '(ede-project-directories '("/home/dengjf/work/src/CVS_CMS/CMS"))
 '(global-mark-ring-max 32)
 '(package-selected-packages
   '(ggtags helm-gtags projectile-speedbar helm-projectile helm pyim magit sr-speedbar))
 '(warning-suppress-types '((comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'package)
;;(add-to-list 'package-archives
;;	     '("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/") t)
(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/")))
(package-initialize)

;; cedet
;;(message "setup CEDET ...")
;;(require 'cedet)
;;(require 'semantic)
;;(global-semanticdb-minor-mode t)
;;(global-semantic-idle-scheduler-mode t)
;;(global-semantic-idle-summary-mode t)
;;;;(global-senator-minor-mode t)
;;(global-semantic-mru-bookmark-mode t)
;;(global-semantic-stickyfunc-mode t)
;;(global-semantic-idle-completions-mode t)
;;(global-semantic-highlight-func-mode t)
;;;;(global-semantic-idle-tag-highlight-mode t)
;;;;(global-which-func-mode t)
;;(global-semantic-highlight-edits-mode t)
;;(semantic-mode t)
(semantic-mode nil)
;;(global-ede-mode t)
(require 'speedbar)

(message "setup sr-speedbar ...")
;;(require 'sr-speedbar)
;;(global-set-key (kbd "s-s") 'sr-speedbar-toggle)
(global-set-key (kbd "s-s") 'projectile-speedbar-toggle)
(global-set-key (kbd "M-<f2>") 'projectile-speedbar-open-current-buffer-in-tree)

;; ecb
;;(message "setup ECB ...")
;;(require 'ecb)
;;;;(setq ecb-layout-name "left1")
;;;;(setq max-lisp-eval-depth 2000)
;;(setq ecb-auto-activate t)

;; google-c-style
(message "setup google-c-style ...")
(add-to-list 'load-path "~/.emacs.d/site-lisp")
(require 'google-c-style)

(defun dengjf/c-mode-keys()
  (setq-default indent-tabs-mode nil)
  (setq default-tab-width 4)
  (google-set-c-style)
  (google-make-newline-indent)
  (setq c-basic-offset 4)
  (setq tab-width 4)
  
  (semantic-default-c-setup)
  (local-set-key [(control return)] 'semantic-ia-complete-symbol)
  (local-set-key "\C-c/" 'semantic-ia-complete-symbol)
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-cb" 'semantic-mrub-switch-tags)
  (local-set-key "\C-cR" 'semantic-symref)
  (local-set-key "\C-cr" 'semantic-symref-symbol)
  (local-set-key "\C-cj" 'semantic-ia-fast-jump)
;;  (local-set-key "." 'semantic-complete-self-insert)
;;  (local-set-key ">" 'semantic-complete-self-insert)
;;  (local-set-key [(tab)] 'indent-or-complete)
;;  (local-set-key [(f4)] 'speedbar-get-focus)
)
(add-hook 'c-mode-common-hook 'dengjf/c-mode-keys)

;; ggtags
(require 'ggtags)
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1))))

;; chinese input method setup
(message "setup pyim ...")
(require 'pyim)
;;(require 'pyim-basedict)
;;(pyim-basedict-enable)
(setq default-input-method "pyim")
