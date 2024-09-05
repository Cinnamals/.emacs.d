(setq package-selected-packages
      '(dart-mode lsp-mode lsp-dart lsp-treemacs flycheck company
                  lsp-ui company hover))

(add-hook 'dart-mode-hook 'lsp)
(add-to-list 'load-path "~/.emacs.d/manually-installed-packages/")
(add-to-list 'auto-mode-alist '("\\.dart\\'" . dart-mode))

(use-package dart-mode
  :hook (dart-mode . flutter-test-mode))

(use-package flutter
  :after dart-mode
  :bind (:map dart-mode-map
              ("C-M-x" . #'flutter-run-or-hot-reload))
  :config
  (setq flutter-sdk-path (expand-file-name "~/dev-sdk/flutter")))

(use-package lsp-mode
  :ensure t
  :hook (dart-mode . lsp)
  :commands lsp
  :config
  (setq lsp-dart-sdk-dir (expand-file-name "~/dev-sdk/flutter/bin/cache/dart-sdk")))

(provide 'dart-init)
