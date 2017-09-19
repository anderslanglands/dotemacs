;;; layer-evil --- Evil config

;;; Commentary:

;;; Code:

(use-package evil
  :ensure t
  :config
  (evil-mode 1)

  (use-package evil-surround
    :ensure t
    :config
    (global-evil-surround-mode))

  (use-package evil-commentary
      :ensure t
      :diminish 'evil-commentary-mode
      :config
      (evil-commentary-mode)
      )
  )


(provide 'layer-evil)
;;; layer-evil ends here
