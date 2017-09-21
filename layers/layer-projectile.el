;;; layer-projectile --- Projectile setup

;;; Commentary:

;;; Code:
(message "Loading layer-projectile...")

(use-package projectile :ensure t
  :config
  ;; (use-package counsel-projectile :ensure t)
  (setq projectile-mode-line
        '(:eval (format " %s" (projectile-project-name))))
  (projectile-mode)
  (put 'projectile-project-compilation-cmd 'safe-local-variable
       (lambda (a) (and (stringp a)
                        (or (not (boundp 'compilation-read-command))
                            compilation-read-command))))
  )


(provide 'layer-projectile)
;;; layer-projectile.el ends here
