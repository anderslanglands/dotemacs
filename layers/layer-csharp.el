;;; layer-csharp.el --- C# setup

;;; Commentary:

;;; Code:
(message "Loading layer-csharp...")

(use-package csharp-mode :ensure t
  :config
  (add-hook 'csharp-mode-hook 'omnisharp-mode
  (setq company-idle-delay 0.1)
               ))
(use-package omnisharp :ensure t
  :config
  (add-to-list 'company-backends 'company-omnisharp)
  (setq omnisharp-server-executable-path "/usr/local/bin/omnisharp"))

(provide 'layer-csharp)
;;; layer-csharp.el ends here
