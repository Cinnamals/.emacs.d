;; Machine predicates.
(defun at-home-p ()
  (string= (system-name) "mattias"))

(defun at-work-p ()
  (string= (system-name) "nojob ;_;"))

(setq gc-cons-threshold (* 128 1024 1024))

;; Increase for lsp-mode:
(setq read-process-output-max (* 1024 1024))

(setq create-lockfiles nil)

;;; Start emacs server.
(server-start)

;;; Set default startup directory.
(setq default-directory "~/")

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

;;; Load configuration without dependencies.
(require 'base)

;;; Initialize 'use-package'.
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;;; TODO: `use-package' is included in Emacs 29. Once Emacs 29 is generally
;;; available, this can be removed.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(require 'bind-key)

(require 'theme-init)
(require 'general-funs)
(require 'ivy-init)
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
(require 'cmake-init)
(require 'python-init)
(require 'glsl-init)
(require 'pike-init)
(require 'eshell-init)
(require 'dired-init)
(require 'yas-init)
(require 'latex-init)
(require 'java-init)
(require 'avy-init)
(require 'languagetool-init nil 'noerror)
(require 'treesit-init)

;; Load API keys from secret.el if present on the system.
(require 'secret nil 'noerror)

(require 'key-bindings)

;; Scrolling on some mice results in a 'C-M-[()]'
;; bind these to scroll.
(global-set-key (kbd "C-M-(") 'mwheel-scroll)
(global-set-key (kbd "C-M-)") 'mwheel-scroll)

(custom-set-variables
 '(package-selected-packages
   '(ox-slack vue-mode ox-jira puppet-mode python-black pip-requirements speed-type dired-narrow editorconfig po-mode python-pytest ayu-theme spacemacs-theme github-theme string-inflection fill-column-indicator htmlize which-key expand-region org-bullets multiple-cursors matlab-mode minions moody doom-modeline poet-theme highlight-escape-sequences gruvbox-theme hl-todo highlight2clipboard dashboard all-the-icons counsel-tramp yasnippet counsel-spotify ivy-rich gist glsl-mode company-anaconda anaconda-mode kotlin-mode flycheck-kotlin cmake-font-lock rjsx-mode dap-mode projectile-ripgrep flycheck flycheck-mode lsp-ui cquery company-lsp use-package swiper company))
 '(safe-local-variable-values
   '((eval when
           (and
            (not
             (eq major-mode 'conf-windows-mode))
            (buffer-file-name)
            (file-regular-p
             (buffer-file-name))
            (string-match-p "^[^.].*\\.ini"
                            (file-name-nondirectory
                             (buffer-file-name))))
           (conf-windows-mode)))))

(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
