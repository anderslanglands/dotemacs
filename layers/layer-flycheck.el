;;; layer-flycheck.el --- Flycheck

;;; Commentary:

;;; Code:
(message "Loading layer-flycheck...")

(use-package flycheck :ensure t
    :diminish '(flycheck-mode . "")
    :config
    (add-hook 'after-init-hook #'global-flycheck-mode)
    )

(provide 'layer-flycheck)
;;; layer-flycheck.el ends here
