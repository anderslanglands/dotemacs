;;; layer-c++.el --- C++ setup

;;; Commentary:

;;; Code:
(message "Loading layer-c++...")

;; .h files are c++ by default
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

(use-package clang-format :ensure t
  )

;; (use-package rtags :ensure t
;;     :config
;;     (setq rtags-autostart-diagnostics t)
;;     (setq rtags-display-result-backend 'ivy)
;;     )

;; (use-package ivy-rtags :ensure t)
;; (use-package flycheck-rtags :ensure t)

;; (defun my-rtags-setup ()
;;   "RTags setup function."
;;     (rtags-diagnostics)
;;     (rtags-start-process-unless-running)
;;     (flycheck-select-checker 'rtags)
;;     (setq-local flycheck-highlighting-mode nil)
;;     (setq-local flycheck-check-syntax-automatically nil)
;; )
;; (add-hook 'c-mode-hook #'my-rtags-setup)
;; (add-hook 'c++-mode-hook #'my-rtags-setup)

;; (use-package ycmd :ensure t
;;   :config
;;   (add-hook 'c++-mode-hook 'ycmd-mode)
;;   (set-variable 'ycmd-server-command '("python" "/Users/anders/code/ycmd/ycmd"))
;;   (set-variable 'ycmd-global-config "/Users/anders/code/ycm_global_config.py")
;;   (set-variable 'ycmd-extra-conf-whitelist '("/Users/anders/code/*"))
;;   )

;; (use-package company-ycmd :ensure t
;;   :config
;;   (company-ycmd-setup)
;;   )

(c-set-offset 'innamespace 0)

(require 'layer-cquery)

(provide 'layer-c++)
;;; layer-c++.el ends here
