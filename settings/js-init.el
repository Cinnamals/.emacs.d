(use-package tide
  :ensure t
  :bind (:map global-map
	      ("C-M-k" . c-doc-comment)
	      ("C-M-j" . c-block-comment)))

(defun my/ts-hook ()
  (interactive)
  (lsp-mode)
  (flycheck-mode 1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))

  (eldoc-mode 1)
  (company-mode 1))

(use-package typescript-mode
  :ensure t
  :mode (("\\.ts\\'" . typescript-mode)
         ("\\.js\\'" . typescript-mode))
  :hook (typescript-mode . my/ts-hook))

(provide 'js-init)
