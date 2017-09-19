;;; layer-cmake --- cmake

;;; Commentary:

;;; Code:
(message "Loading layer-cmake...")

(use-package cmake-mode :ensure t
    :config
    (cmake-mode))

(use-package cmake-font-lock :ensure t
    :config
    (add-hook 'cmake-mode-hook 'cmake-font-lock-activate))

(provide 'layer-cmake)
;;; layer-cmake.el ends here

