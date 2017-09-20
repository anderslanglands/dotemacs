;;; layer-helm --- Helm

;;; Commentary:

;;; Code:
(message "Loading layer-helm...")

(use-package helm :ensure t
  :config
  (require 'helm-config)
  (setq helm-M-x-fuzzy-match t)
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "M-y") 'helm-show-kill-ring)
  (helm-mode 1)
  )


(provide 'layer-helm)
;;; layer-helm.el ends here

