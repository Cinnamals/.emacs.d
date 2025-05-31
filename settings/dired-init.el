
(defun dired-beginning-of-buffer ()
  "Go to first entry in dired buffer."
  (interactive)
  (beginning-of-buffer)
  (dired-next-line 4))

(defun dired-end-of-buffer ()
  "Go to the last entry in dired buffer."
  (interactive)
  (end-of-buffer)
  (dired-previous-line 1))


(defun unzip-file-in-dired ()
  "Unzip the .zip file at point in dired into a directory with the same name without .zip."
  (interactive)
  (let* ((file (dired-get-file-for-visit))
         (ext (file-name-extension file))
         (output-dir (file-name-sans-extension file)))
    (if (and ext (string= ext "zip"))
        (progn
          (shell-command (format "unzip -d %s %s" (shell-quote-argument output-dir) (shell-quote-argument file)))
          (message "Unzipped %s into %s" file output-dir)
          (revert-buffer)) ;; refresh dired buffer
      (message "Not a zip file: %s" file))))

(defun my/dired-mode-hook ()
  (local-set-key (kbd "M-<") 'dired-beginning-of-buffer)
  (local-set-key (kbd "M->") 'dired-end-of-buffer)
  (all-the-icons-dired-mode))

(add-hook 'dired-mode-hook 'my/dired-mode-hook)

(setq dired-dwim-target t)

(use-package all-the-icons-dired
  :ensure t
  :after all-the-icons)
(provide 'dired-init)
