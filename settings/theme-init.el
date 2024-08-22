(load-theme 'tango-dark t)

(let ((h (system-name)))
  (cond ((at-home-p)
         (set-face-attribute 'default nil
                             :family "Iosevka"
                             :height 110
                             :weight 'normal
                             :width 'normal))
         ((at-work-p)
          (set-face-attribute 'default nil
                              :family "JetBrains Mono"
                              :height 90
                              :weight 'normal
                              :width 'normal))))

(setq frame-title-format `("%b@emacs" ,(number-to-string emacs-major-version)))

(provide 'theme-init)
