;;; layer-writing.el --- Fountain and Olivetti

;;; Commentary:

;;; Code:
(message "Loading layer-writing...")

(use-package info+ :ensure t
  :defer t)

(use-package imenu-list :ensure t
  :defer t)

(defun my-fountain-setup ()
  "Setup Fountain and Olivetti."
  (olivetti-mode)
  )

(use-package fountain-mode :ensure t
  :defer t
  :config
  (add-hook 'fountain-mode-hook #'my-fountain-setup)
  (use-package olivetti :ensure t
    :diminish '(olivetti-mode . ""))
  )


(provide 'layer-writing)
;;; layer-writing.el ends here
