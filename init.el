;;; Package --- init.el
;;; Commentary:
;;; 
;;; Code:
(setq-default gc-cons-threshold 100000000)
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
             '("gnu" . "http://elpa.gnu.org/packages/"))

(package-initialize)

(setq package-check-signature nil)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package benchmark-init :ensure t)
(benchmark-init/activate)
(add-to-list 'load-path "~/.emacs.d/layers")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (omnisharp company-cmake cmake-font-lock imenu-list olivetti fountain-mode yapfify py-yapf fill-column-indicator company-anaconda anaconda-mode dim cyphejor spaceline-config cmake zenburn-theme which-key use-package tangotango-theme sourcerer-theme powerline-evil moe-theme ivy-rtags heroku-theme gruvbox-theme general foggy-night-theme flycheck-rtags flatland-theme evil-surround evil-magit evil-commentary esup dtrt-indent counsel-projectile company-ycmd company-rtags color-theme-sanityinc-tomorrow clang-format base16-theme))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(let ((file-name-handler-alist nil))
(require 'layer-init)
)
(provide 'init)

(setq-default gc-cons-threshold 800000)
;;; init.el ends here
