;;; layer-helm --- Helm

;;; Commentary:

;;; Code:
(message "Loading layer-helm...")

(use-package helm :ensure t
  :config
  (require 'helm-config)
  (setq helm-M-x-fuzzy-match t)
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "M-y") 'helm-show-kill-ring)
  (helm-mode 1)

  (defun helm-buffer-switch-to-new-window (_candidate)
    "Display buffers in new windows."
    ;; Select the bottom right window
    (require 'winner)
    (select-window (car (last (winner-sorted-window-list))))
    ;; Display buffers in new windows
    (dolist (buf (helm-marked-candidates))
      (select-window (split-window-right))
      (switch-to-buffer buf))
    ;; Adjust size of windows
    (balance-windows))

  (defun helm-buffer-find-new-window (_candidate)
    "Display buffers in new windows."
    ;; Select the bottom right window
    (require 'winner)
    (select-window (car (last (winner-sorted-window-list))))
    ;; Display buffers in new windows
    (dolist (buf (helm-marked-candidates))
      (select-window (split-window-right))
      (message "Finding buf")
      (find-file buf))
    ;; Adjust size of windows
    (balance-windows))

  (use-package helm-projectile :ensure t)

  (add-to-list 'helm-type-buffer-actions
              '("Display buffer(s) in new window(s) `C-<return>'" .
                helm-buffer-switch-new-window) 'append)

  (add-to-list 'helm-projectile-file-actions
              '("Open file(s) in new window(s) `C-<return>'" .
                helm-buffer-find-new-window) 'append)

  (defun helm-buffer-switch-new-window ()
    (interactive)
    (with-helm-alive-p
      (helm-quit-and-execute-action 'helm-buffer-switch-to-new-window)))

  (define-key helm-buffer-map (kbd "C-<return>") #'helm-buffer-switch-new-window)
  (define-key helm-projectile-find-file-map (kbd "C-<return>") #'helm-buffer-find-new-window)
  )


(provide 'layer-helm)
;;; layer-helm.el ends here

