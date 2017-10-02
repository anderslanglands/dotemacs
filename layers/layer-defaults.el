;;; layer-defaults.el --- Basic emacs settings

;;; Commentary:

;;; Code:
(message "Loading layer-defaults...")

;; delete excess backup versions silently
(setq delete-old-versions -1) ; 

;; use version control
(setq version-control t)

;; make backups file even when in version controlled dir
(setq vc-make-backup-files t)

;; which directory to put backups file
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))

;; don't ask for confirmation when opening symlinked file
(setq vc-follow-symlinks t)

;; transform backups file name
(setq auto-save-file-name-transforms
      '((".*" "~/.emacs.d/auto-save-list/" t)))

;; inhibit useless and old-school startup screen
(setq inhibit-startup-screen t)

;; silent bell when you make a mistake
(setq ring-bell-function 'ignore)

;; use utf-8 by default
(setq coding-system-for-read 'utf-8 )
(setq coding-system-for-write 'utf-8 )

;; sentence SHOULD end with only a point.
(setq sentence-end-double-space nil)

;; toggle wrapping text at the 80th character
(setq fill-column 80)

;; print a default message in the empty scratch buffer opened at startup
(setq initial-scratch-message "")

(recentf-mode 1)
(setq recentf-max-menu-items 25)

;; start maximized
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; no toolbar please i'm not 5 years old
(tool-bar-mode -1)
(savehist-mode 1)

(add-hook 'prog-mode-hook 'column-number-mode)
(add-hook 'prog-mode-hook 'linum-mode)

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

(set-frame-font "Hasklug Nerd Font Mono")

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(mac-auto-operator-composition-mode 1)

;; Make Emacs split window horizontally when opening multiple files
;; (setq split-height-threshold nil)
;; (setq split-width-threshold 0) 

(provide 'layer-defaults)
;;; layer-defaults.el ends here
