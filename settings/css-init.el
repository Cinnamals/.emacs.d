(add-hook 'css-mode-hook 'company-mode)

(with-eval-after-load 'company
  (add-to-list 'company-backends 'company-css))

(provide 'css-init)
