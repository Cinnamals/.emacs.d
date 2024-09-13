(defvar my-flutter-sdk-path (expand-file-name "~/dev-sdk/flutter")
  "Path to the Flutter SDK bin")

(defvar my-dart-sdk-dir (expand-file-name "bin/cache/dart-sdk/" my-flutter-sdk-path)
  "Path to the Dart SDK bin (inside Flutter SDK).")

(add-to-list 'load-path (expand-file-name "manually-installed-packages" user-emacs-directory))

(add-to-list 'auto-mode-alist '("\\.dart\\'" . dart-mode))

(add-hook 'dart-mode-hook 'lsp)

(use-package dart-mode
  :hook (dart-mode . flutter-test-mode))

(use-package flutter
  :after dart-mode
  :bind (:map dart-mode-map
              ("C-M-x" . #'flutter-run-or-hot-reload))
  :config
  (setq flutter-sdk-path my-flutter-sdk-path ))

(use-package lsp-mode
  :ensure t
  :hook (dart-mode . lsp)
  :commands lsp
  :config
  (setq lsp-dart-sdk-dir my-dart-sdk-dir ))

(defun my-dart-mode-setup ()
  (setq-local company-idle-delay 0.1)
  (setq-local flycheck-checker 'lsp)
  (setq-local flycheck-idle-change-delay 0.2)
  (setq-local lsp-file-watch-threshold 200)
  (setq-local lsp-diagnostics-max-number 5)
  (setq-local lsp-idle-delay 1.0)
  (setq-local lsp-file-watch-ignored
        '("[/\\\\]\\.git$" "[/\\\\]node_modules$" "[/\\\\]build$" "[/\\\\]dist$"))
  (add-hook 'post-self-insert-hook 'my-company-complete-after-dot nil t))

(add-hook 'dart-mode-hook 'my-dart-mode-setup)

;; Ensure that the worlds most annoying auto-complete hook only triggers in dart-mode
(defun my-company-complete-after-dot ()
  (when (and (derived-mode-p 'dart-mode) (looking-back "\\." 1))
    (company-complete)))

(add-hook 'post-self-insert-hook 'my-company-complete-after-dot)

(provide 'dart-init)
