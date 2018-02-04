;;; layer-cquery.el --- cquery setup

;;; Commentary:

;;; Code:
(message "Loading layer-cquery")

(use-package lsp-mode :ensure t)

(use-package company-lsp :ensure t
  :config
  (push 'company-lsp company-backends)
  )

(require 'cquery)

(defun my-cpp-hook ()
  "C++ Hook function"
  (require 'lsp-mode)
  (require 'lsp-flycheck)
  ;; (require 'lsp-ui)
  ;; (add-hook 'lsp-mode-hook 'lsp-ui-mode)
  (lsp-cquery-enable)
  )

(setq cquery-executable "/Users/anders/code/cquery/build/app")
(setq cquery-resource-dir "/Users/anders/code/cquery/clang_resource_dir")

(add-hook 'c++-mode-hook #'my-cpp-hook)
          
(provide 'layer-cquery)
;;; layer-cquery.el ends here
