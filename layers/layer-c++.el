;;; layer-c++.el --- C++ setup

;;; Commentary:

;;; Code:
(message "Loading layer-c++...")

;; .h files are c++ by default
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

(use-package clang-format :ensure t)

(use-package rtags :ensure t
    :config
    (setq rtags-autostart-diagnostics t)
    (setq rtags-completions-enabled t)
    (setq rtags-display-result-backend 'ivy)
    (eval-after-load 'company
    '(add-to-list
        'company-backends 'company-rtags))
    )

(use-package company-rtags :ensure t)
(use-package ivy-rtags :ensure t)
(use-package flycheck-rtags :ensure t)

(defun my-rtags-setup ()
  "RTags setup function."
    (rtags-diagnostics)
    (rtags-start-process-unless-running)
    (flycheck-select-checker 'rtags)
    (setq-local flycheck-highlighting-mode nil)
    (setq-local flycheck-check-syntax-automatically nil)
)
(add-hook 'c-mode-hook #'my-rtags-setup)
(add-hook 'c++-mode-hook #'my-rtags-setup)

(provide 'layer-c++)
;;; layer-c++.el ends here
