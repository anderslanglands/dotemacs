;;; layer-indentation.el --- Anything to do with indentation

;;; Commentary:

;;; Code:
(message "Loading layer-indentation...")

(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)
(setq-default c-default-style "bsd")
(setq indent-line-function 'insert-tab)
(setq electric-indent-inhibit t)

(use-package dtrt-indent :ensure t
  :config (dtrt-indent-mode 1))

(provide 'layer-indentation)
;;; layer-indentation.el ends here
