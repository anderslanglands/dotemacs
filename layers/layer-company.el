;;; layer-company --- Company autocompletion

;;; Commentary:

;;; Code:
(message "Loading layer-company...")

(use-package company :ensure t
  :config
  (setq company-minimum-prefix-length 0)
  (setq company-dabbrev-downcase 0)
  (setq company-idle-delay 0.5)
  (global-company-mode)
  :diminish '(company-mode . "")
  )

(provide 'layer-company)
;;; layer-company.el ends here

