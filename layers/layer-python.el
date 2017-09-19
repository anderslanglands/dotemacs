;;; layer-python --- Python setup

;;; Commentary:

;;; Code:
(message "Loading layer-python...")

(use-package yapfify :ensure t)

(use-package anaconda-mode :ensure t
    :diminish '(anaconda-mode . "")
    :config
    (add-hook 'python-mode-hook 'anaconda-mode)
    )

(use-package company-anaconda :ensure t
    :config
    (eval-after-load "company"
    '(add-to-list 'company-backends 'company-anaconda))
    )

(provide 'layer-python)
;;; layer-python.el ends here
