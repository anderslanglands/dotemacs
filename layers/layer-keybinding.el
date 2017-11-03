;;; layer-keybinding --- General and which-key

;;; Commentary:

;;; Code:
(message "Loading layer-keybinding...")

(use-package which-key :ensure t
  :diminish 'which-key-mode
  :config
  (which-key-mode)
  (which-key-setup-minibuffer)
  (setq which-key-popup-type 'minibuffer)
  )

(use-package general
  :ensure t
  :config
  (general-evil-setup)
  (setq general-default-keymaps 'evil-normal-state-map)
  (general-define-key
   :prefix "g"
   "h" 'windmove-left
   "j" 'windmove-down
   "k" 'windmove-up
   "l" 'windmove-right
   )

  (general-define-key
   :prefix "SPC"

   "<tab>" 'mode-line-other-buffer
   
   "b" '(:ignore t :which-key "Buffers...")
   "bb" 'helm-mini
   "bd" (lambda () (interactive (kill-buffer (current-buffer))))

   "f" '(:ignore t :which-key "Files...")
   "fs" 'save-buffer
   "ff" 'helm-find-files
   "fed" (lambda () (interactive) (find-file user-init-file))
   "feD" (lambda () (interactive)
           (find-file-other-window user-init-file))
   "feR" '(lambda () (interactive) (load-file user-init-file))

   "w" '(:ignore t :which-key "Windows...")
   "wh" 'windmove-left
   "wj" 'windmove-down
   "wk" 'windmove-up
   "wl" 'windmove-right
   "ww" 'other-window
   "w0" 'delete-other-windows
   "wd" 'kill-buffer-and-window

   "r" '(:ignore t :which-key "RTags...")
   "ri" 'rtags-symbol-info
   "rt" 'rtags-symbol-type
   "rr" 'rtags-rename-symbol
   "rf" 'rtags-find-symbol-at-point

   "p" '(:ignore t :which-key "Projectile...")
   "pp" 'helm-projectile-switch-project
   "pf" 'helm-projectile-find-file
   "pF" 'projectile-find-file-other-window
   "po" 'helm-projectile-find-other-file
   "pa" 'helm-projectile-ag
   "pc" 'projectile-compile-project

   "g" '(:ignore t :which-key "Git...")
   "gs" 'magit-status

   "t" '(:ignore t :which-key "Theme...")
   ;; "ts" 'counsel-load-theme

   "i" '(:ignore t :which-key "Imenu...")
   "il" 'imenu-list-smart-toggle

   ;; "/" 'swiper

  )

  (general-define-key :keymaps 'python-mode-map
   "C-<tab>" 'yapfify-buffer)

  (general-define-key :keymaps 'c++-mode-map
   "C-<tab>" 'clang-format-buffer

   "C-." 'rtags-find-symbol-at-point
   "C-;" 'rtags-location-stack-back
   "C-'" 'rtags-location-stack-forward
   )
 )

(provide 'layer-keybinding)
;;; layer-keybinding.el ends here
