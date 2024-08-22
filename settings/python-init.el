(use-package lsp-pyright
  :ensure t)

(defun my/python-coverage-current-buffer ()
  "Check coverage for current buffer"
  (interactive)
  (shell-command (concat "coverage run --branch " (buffer-file-name))))

(defun my/python-coverage-pop-up-report ()
  "Show python coverage report in new window"
  (interactive)
  (with-temp-buffer-window "*coverage*" 'display-buffer-pop-up-window nil
    (prin1 (shell-command-to-string "coverage report"))))

(defun my/python-coverage-open-html ()
  "Check coverage, generate html report, and open it with the
default browser"
  (interactive)
  (my/python-coverage-current-buffer)
  (let ((dir (make-temp-file "coverage" t)))
    (shell-command (concat "coverage html -d " dir))
    (shell-command (concat "xdg-open " (expand-file-name "index.html" dir)))))

(defun my/python-vermin-file ()
  "Run vermin on the currently visited file, showing the results
in the echo area."
  (interactive)
  (message (string-trim
            (shell-command-to-string
             (concat "vermin " (buffer-file-name))))))

(defun my/python-block-comment ()
  (interactive)
  (beginning-of-line)
  (open-line 1)
  (let* ((indent (current-column))
	 (stars (make-string (- 78 indent) ?#)))
    (insert stars "\n")
    (indent-to indent)
    (insert "# \n")
    (indent-to indent)
    (insert stars)
    (end-of-line 0)))

(use-package pip-requirements
  :ensure t)

(use-package python-black
  :after python
  :ensure t
  :hook (python-mode . python-black-on-save-mode-enable-dwim))

(defun my/python-mode-hook ()
  (require 'lsp-pyright)
  (lsp)
  (company-mode)
  (column-number-mode)
  ;; LSP (that I feel uncomfortable lifting out globally):
  (local-set-key (kbd "C-c s") 'lsp-ivy-workspace-symbol)
  ;; Coverage:
  (local-set-key (kbd "C-c c c") 'my/python-coverage-current-buffer)
  (local-set-key (kbd "C-c c r") 'my/python-coverage-pop-up-report)
  (local-set-key (kbd "C-c c h") 'my/python-coverage-open-html)
  (local-set-key (kbd "C-c v") 'my/python-vermin-file))

(add-hook 'python-mode-hook 'my/python-mode-hook)

(provide 'python-init)
