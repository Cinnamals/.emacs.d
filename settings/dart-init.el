(defvar my-flutter-sdk-path (expand-file-name "~/dev-sdk/flutter")
  "Path to the Flutter SDK bin")

(defvar my-dart-sdk-dir (expand-file-name "bin/cache/dart-sdk/" my-flutter-sdk-path)
  "Path to the Dart SDK bin (inside Flutter SDK).")

(setq package-selected-packages
      '(dart-mode lsp-dart lsp-treemacs))

(add-to-list 'load-path (expand-file-name "manually-installed-packages" user-emacs-directory))

(use-package flutter
  :after dart-mode
  :bind (:map dart-mode-map
              ("C-M-x" . #'flutter-run-or-hot-reload))
  :config
  (setq lsp-dart-sdk-dir my-dart-sdk-dir ))

(when (cl-find-if-not #'package-installed-p package-selected-packages)
  (package-refresh-contents)
  (mapc #'package-install package-selected-packages))

(add-hook 'dart-mode-hook 'lsp)

(provide 'dart-init)
