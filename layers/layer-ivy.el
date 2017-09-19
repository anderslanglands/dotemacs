;;; layer-ivy --- Ivy, counsel and swiper

;;; Commentary:

;;; Code:
(message "Loading layer-ivy...")

(use-package ivy :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  :diminish 'ivy-mode
  )
(use-package counsel :ensure t)
(use-package swiper :ensure t)

(provide 'layer-ivy)
;;; layer-ivy.el ends here

