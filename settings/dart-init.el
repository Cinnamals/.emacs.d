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

(provide 'dart-init)
