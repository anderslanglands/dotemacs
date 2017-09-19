;;; layer-misc --- Random bits of setup code

;;; Commentary:
;;; Everything left that didn't fit into another layer

;;; Code:
(message "Loading layer-misc...")
(setq delete-old-versions -1) ; delete excess backup versions silently
(setq version-control t)		; use version control
;; make backups file even when in version controlled dir
(setq vc-make-backup-files t)
; which directory to put backups file
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))
; don't ask for confirmation when opening symlinked file
(setq vc-follow-symlinks t)
;transform backups file name
(setq auto-save-file-name-transforms
      '((".*" "~/.emacs.d/auto-save-list/" t)))
; inhibit useless and old-school startup screen
(setq inhibit-startup-screen t)
; silent bell when you make a mistake
(setq ring-bell-function 'ignore)
; use utf-8 by default
(setq coding-system-for-read 'utf-8 )
(setq coding-system-for-write 'utf-8 )
; sentence SHOULD end with only a point.
(setq sentence-end-double-space nil)
; toggle wrapping text at the 80th character
(setq fill-column 80)
; print a default message in the empty scratch buffer opened at startup
(setq initial-scratch-message "")
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
; .h files are c++
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
(tool-bar-mode -1)
(savehist-mode 1)

(use-package evil
  :ensure t
  :config
  (evil-mode 1)

  (use-package evil-surround
    :ensure t
    :config
    (global-evil-surround-mode))
 )

(use-package powerline :ensure t
    :config
    (setq powerline-default-separator 'wave)
    )
(use-package powerline-evil :ensure t
  :config (powerline-evil-center-color-theme))


(use-package magit :ensure t
  :config
  (use-package evil-magit :ensure t)
  )

(use-package which-key :ensure t
  :config
  (which-key-mode)
  (which-key-setup-minibuffer)
 (setq which-key-popup-type 'minibuffer) )

(use-package ivy :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t))
(use-package counsel :ensure t)
(use-package swiper :ensure t)
(use-package clang-format :ensure t)
(use-package yapfify :ensure t)

(use-package anaconda-mode :ensure t
    :config
(add-hook 'python-mode-hook 'anaconda-mode)
    )

(use-package company-anaconda :ensure t
    :config
    (eval-after-load "company"
    '(add-to-list 'company-backends 'company-anaconda))
    )

(use-package cmake-mode :ensure t
    :config
    (cmake-mode))
(use-package cmake-font-lock :ensure t
    :config
    (add-hook 'cmake-mode-hook 'cmake-font-lock-activate))
    
;; (use-package company-cmake :ensure t
;;   :config
;;   (add-to-list 'company-backends 'company-cmake)
;;     )

(use-package imenu-list :ensure t)

(defun my-fountain-setup ()
  "Setup Fountain and Olivetti."
  (olivetti-mode)
  )

(use-package fountain-mode :ensure t
  :config
  (add-hook 'fountain-mode-hook #'my-fountain-setup)
  )
(use-package olivetti :ensure t)

(use-package general
  :ensure t
  :config
  (general-evil-setup)
  (setq general-default-keymaps 'evil-normal-state-map)
  (general-define-key
   :prefix "SPC"

   "<tab>" 'mode-line-other-buffer
   
   "b" '(:ignore t :which-key "Buffers...")
   "bb" 'ivy-switch-buffer
   "bB" 'switch-to-buffer-other-window
   "bd" (lambda () (interactive (kill-buffer (current-buffer))))

   "f" '(:ignore t :which-key "Files...")
   "fs" 'save-buffer
   "ff" '(counsel-find-file)
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

   "p" '(:ignore t :which-key "Projectile...")
   "pp" 'counsel-projectile-switch-project
   "pf" 'counsel-projectile-find-file
   "pF" 'projectile-find-file-other-window
   "po" 'projectile-find-other-file
   "pa" 'counsel-projectile-ag
   "pc" 'projectile-compile-project

   "g" '(:ignore t :which-key "Git...")
   "gs" 'magit-status

   "t" '(:ignore t :which-key "Theme...")
   "ts" 'counsel-load-theme

   "i" '(:ignore t :which-key "Imenu...")
   "il" 'imenu-list-smart-toggle

   "/" 'swiper
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

(use-package fill-column-indicator :ensure t)

(add-hook 'prog-mode-hook 'column-number-mode)
(add-hook 'prog-mode-hook 'linum-mode)

;; tabs etc
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)
(setq-default c-default-style "bsd")
(setq electric-indent-inhibit t)

(use-package dtrt-indent :ensure t
  :config (dtrt-indent-mode 1))

 (use-package company :ensure t
     :config
     (setq company-minimum-prefix-length 0)
    (setq company-dabbrev-downcase 0)
    (setq company-idle-delay 0.5)
   )

 (use-package rtags :ensure t
   :config
     (setq rtags-autostart-diagnostics t)
     (setq rtags-completions-enabled t)
     (setq rtags-display-result-backend 'ivy)
     (eval-after-load 'company
     '(add-to-list
         'company-backends 'company-rtags))
     )

(global-company-mode)
 (use-package company-rtags :ensure t)
 (use-package ivy-rtags :ensure t)
(use-package flycheck :ensure t
    :config
    (add-hook 'after-init-hook #'global-flycheck-mode)
    )
(use-package flycheck-rtags :ensure t)

(defun my-rtags-setup ()
  "RTags setup function."
    (rtags-diagnostics)
    (rtags-start-process-unless-running)
    (flycheck-select-checker 'rtags)
    (setq-local flycheck-highlighting-mode nil)
    (setq-local flycheck-check-syntax-automatically nil)
)
(add-hook 'c-mode-hook #'my-rtags-setup)
(add-hook 'c++-mode-hook #'my-rtags-setup)

(use-package evil-commentary
    :ensure t
    :config
    (evil-commentary-mode)
    )

(use-package projectile :ensure t
  :config
  (use-package counsel-projectile :ensure t)
  (setq projectile-mode-line
        '(:eval (format "%s" (projectile-project-name))))
  (projectile-mode)
    (put 'projectile-project-compilation-cmd 'safe-local-variable
        (lambda (a) (and (stringp a) (or (not (boundp 'compilation-read-command))
                                        compilation-read-command))))
)

(use-package info+ :ensure t)

(use-package spaceline :ensure t
    :config
    (require 'spaceline-config)
    (spaceline-spacemacs-theme)
    (spaceline-info-mode)
    (setq spacemacs-highlight-face-func
          #'spaceline-highlight-face-evil-state)
    (spaceline-toggle-buffer-size-off)
    (diminish 'ivy-mode ())
    (diminish 'undo-tree-mode ())
    (diminish 'which-key-mode ())
    (diminish 'evil-commentary-mode ())
    (diminish 'auto-revert-mode ())
    (diminish 'company-mode "")
    (diminish 'anaconda-mode "")
    (diminish 'flycheck-mode "")
    (diminish 'olivetti-mode "")
    (diminish 'visual-line-mode "")
    (diminish 'abbrev-mode ())
    (setq powerline-height 20)
)

(use-package foggy-night-theme :ensure t)
(use-package base16-theme :ensure t)
(use-package sourcerer-theme :ensure t)
(load-theme 'base16-ocean t)

;; (set-default-font "Iosevka Nerd Font Mono")
(set-default-font "Hasklug Nerd Font Mono")

;; Close the compilation window if there was no error at all.
(setq compilation-exit-message-function
    (lambda (status code msg)
        ;; If M-x compile exists with a 0
        (when (and (eq status 'exit) (zerop code))
          ;; then bury the *compilation* buffer, so that C-x b doesn't
          ;; go there
          (bury-buffer "*compilation*")
          ;; and return to whatever were looking at before
          (replace-buffer-in-windows "*compilation*"))
        ;; Always return the anticipated result of
        ;; compilation-exit-message-function
        (cons msg code)))

(defun my-vc-git-mode-line-string (orig-fn &rest args)
  "Replace Git in modeline with font-awesome git icon via ORIG-FN and ARGS."
  (let ((str (apply orig-fn args)))
    (replace-regexp-in-string "Mod" ""
        (concat [#xF1D3] ":" (substring-no-properties str 4)))))

(advice-add #'vc-git-mode-line-string
            :around #'my-vc-git-mode-line-string)

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(mac-auto-operator-composition-mode 1)

(provide 'layer-misc)
;;; layer-misc.el ends here
