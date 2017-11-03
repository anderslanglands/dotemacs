;;; layer-init.el --- init the rest of the layers

;;; Commentary:
;;; this brings in everything else

;;; Code:
(message "Loading layer-init...")

;; we'll use diminish for other modes
(use-package diminish :ensure t)

(use-package esup :ensure t)

;; layers to load
(require 'layer-defaults)
(require 'layer-evil)
(require 'layer-indentation)
(require 'layer-ivy)
(require 'layer-keybinding)
(require 'layer-git)
(require 'layer-projectile)
(require 'layer-company)
(require 'layer-flycheck)
(require 'layer-cmake)
(require 'layer-python)
(require 'layer-c++)
(require 'layer-csharp)
(require 'layer-cuda)
(require 'layer-writing)
(require 'layer-spaceline)
(require 'layer-themes)

(provide 'layer-init)
;;; layer-init.el ends here
