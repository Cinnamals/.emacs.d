(use-package tide
  :ensure t
  :bind (:map global-map
	      ("C-M-k" . c-doc-comment)
	      ("C-M-j" . c-block-comment)))

(use-package js-doc
  :ensure t)

;; ;; ;; TS mode
;; (defun my/ts-hook ()
;;   (interactive)
;;   (lsp-mode)
;;   (flycheck-mode 1)
;;   (setq flycheck-check-syntax-automatically '(save mode-enabled))

;;   (eldoc-mode 1)
;;   (company-mode 1)
;;   (js-doc-mode 1)
;;   (define-key typescript-mode-map (kbd "C-c i") 'js-doc-insert-function-doc))

;; (use-package typescript-mode
;;   :ensure t
;;   :mode (("\\.ts\\'" . typescript-mode)
;;          ("\\.js\\'" . typescript-mode)
;;          ("\\.mjs\\'" . typescript-mode))
;;   :hook (typescript-mode . my/ts-hook))
;; ;; ;; TS mode


(defun my/js-tide-hook ()
  (interactive)
  (lsp)
  (company-mode 1)
  (eldoc-mode 1)
  (flycheck-mode 1)
  (tide-setup)
  (define-key js-mode-map (kbd "C-c i") 'tide-jsdoc-template)
  (define-key js-mode-map (kbd "C-c t") 'tide-refactor))

(use-package js-mode
  :ensure nil
  :mode (("\\.js\\'" . js-mode)
         ("\\.mjs\\'" . js-mode))
  :hook (js-mode . my/js-tide-hook))


(provide 'js-init)
