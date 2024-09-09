(use-package company
  :ensure t
  :bind (("C-;" . company-complete-common))
  :init
  (setq company-idle-delay            0.0
	company-minimum-prefix-length 1
	company-show-numbers          nil
	company-tooltip-limit         10
	company-dabbrev-downcase      nil)
  :config
  (setq company-backends (delete 'company-semantic company-backends)))

;; Add a hook to automatically trigger completion after typing "." regardless
(defun my-company-complete-after-dot ()
  (when (looking-back "\\." 1)
    (company-complete)))

(add-hook 'post-self-insert-hook 'my-company-complete-after-dot)

;; (use-package company-lsp
;;   :ensure t
;;   :after (company lsp-mode)
;;   :config
;;   (add-to-list 'company-backends 'company-lsp))

(provide 'company-init)
