;; DWIM comment or uncomment
(defun dwim-comment-or-uncomment ()
  (interactive)
  (if (region-active-p)
      (comment-or-uncomment-region (region-beginning) (region-end))
    (comment-or-uncomment-region (line-beginning-position) (line-end-position))))

(global-set-key (kbd "C-'") 'dwim-comment-or-uncomment)

;; Buffer switching.
(global-set-key (kbd "C-M-.") 'next-buffer)
(global-set-key (kbd "C-M-,") 'previous-buffer)

;; Window switching.
(global-set-key (kbd "C-.") 'other-window)
(global-set-key (kbd "C-,") 'prev-window)

;; Unbind pageup and pagedown
(global-unset-key (kbd "<next>"))
(global-unset-key (kbd "<prior>"))

;; Don't show buffer kill prompt.
(global-set-key (kbd "C-x k") 'kill-this-buffer)

;; Revert buffer.
(global-set-key (kbd "C-?") '(lambda ()
                               (interactive)
                               (message "Buffer reverted from file")
                               (revert-buffer t t)))

(global-set-key (kbd "C-x M-e") 'eval-and-kill-last-sexp)

(global-set-key (kbd "C-S-w") 'copy-to-markdown-snippet)

;; Allows reopening recently killed buffers with C-x j and C-x C-j
(global-set-key (kbd "C-x j") 'reopen-killed-file)
(global-set-key (kbd "C-x C-j") 'reopen-killed-file-fancy)

(provide 'key-bindings)
