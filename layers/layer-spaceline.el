;;; layer-spaceline --- Spaceline

;;; Commentary:

;;; Code:
(message "Loading layer-spaceline...")

(use-package spaceline :ensure t
    :config
    (require 'spaceline-config)
    (spaceline-spacemacs-theme)
    (spaceline-info-mode)
    (setq spacemacs-highlight-face-func
          #'spaceline-highlight-face-evil-state)
    (spaceline-toggle-buffer-size-off)
    (setq powerline-default-separator 'wave)
    (powerline-evil-center-color-theme)
    (diminish 'undo-tree-mode ())
    (diminish 'visual-line-mode "")
    (diminish 'abbrev-mode ())
    (diminish 'auto-revert-mode ())
    (setq powerline-height 20)
)

(provide 'layer-spaceline)
;;; layer-spaceline.el ends here
