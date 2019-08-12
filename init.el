;;; Set ~/workbench/ as default startup directory.
(setq default-directory "~/workbench/")

;;; Add load paths.
;;;; Settings path.
(setq settings-dir
      (expand-file-name "settings" user-emacs-directory))

;;;; Functions dir.
(setq funs-dir
      (expand-file-name "funs" user-emacs-directory))

;;;; Generic load dir.
(setq load-dir
      (expand-file-name "load" user-emacs-directory))


(add-to-list 'load-path settings-dir)
(add-to-list 'load-path funs-dir)
(add-to-list 'load-path load-dir)

(add-to-list 'default-frame-alist
             '(font . "Input Mono-10"))

;;; Load configuration without dependencies.
(require 'base)

;;; Initialize 'use-package'.
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(require 'bind-key)

(use-package gruvbox-theme
  :ensure t
  :defer t)

(load-theme 'gruvbox-light-hard t)

(require 'general-funs)
(require 'ivy-init)
(require 'docker-init)
(require 'company-init)
(require 'lsp-init)
(require 'flycheck-init)
(require 'c++-init)
(require 'elisp-init)
(require 'projectile-init)
(require 'compile-init)
(require 'org-init)
(require 'js-init)
(require 'misc-init)
(require 'csharp-init)
(require 'cmake-init)
(require 'kotlin-init)
(require 'python-init)
(require 'glsl-init)
(require 'pike-init)
(require 'eshell-init)

(require 'kattis)

;; Load API keys from secret.el if present on the system.
(require 'secret nil 'noerror)

(setq pike-format-executable
      "/home/williams/workbench/work/tools/format/pike-format.pike")
(require 'pike-format nil 'noerror)

(require 'key-bindings)

;; Scrolling on some mice results in a 'C-M-[()]'
;; bind these to scroll.
(global-set-key (kbd "C-M-(") 'mwheel-scroll)
(global-set-key (kbd "C-M-)") 'mwheel-scroll)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (highlight-escape-sequences gruvbox-theme hl-todo highlight2clipboard dashboard all-the-icons counsel-tramp yasnippet counsel-spotify ivy-rich gist glsl-mode company-anaconda anaconda-mode kotlin-mode flycheck-kotlin cmake-font-lock rjsx-mode dap-mode projectile-ripgrep flycheck flycheck-mode lsp-ui cquery company-lsp use-package swiper company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
