;;; layer-git --- Git and VC setup

;;; Commentary:

;;; Code:
(message "Loading layer-git...")

(use-package magit :ensure t
  :config
;; (setq magit-display-buffer-function
;;       (lambda (buffer)
;;         (display-buffer
;;          buffer (if (and (derived-mode-p 'magit-mode)
;;                          (memq (with-current-buffer buffer major-mode)
;;                                '(magit-process-mode
;;                                  magit-revision-mode
;;                                  magit-diff-mode
;;                                  magit-stash-mode
;;                                  magit-status-mode)))
;;                     nil
;;                   '(display-buffer-same-window)))))
  (use-package evil-magit :ensure t)
  ; start commit message in insert mode
  (add-hook 'git-commit-mode-hook 'evil-insert-state)
  )

(defun my-vc-git-mode-line-string (orig-fn &rest args)
  "Replace Git in modeline with font-awesome git icon via ORIG-FN and ARGS."
  (let ((str (apply orig-fn args)))
    (replace-regexp-in-string "Mod" ""
        (concat [#xF1D3] ":" (substring-no-properties str 4)))))

(advice-add #'vc-git-mode-line-string
            :around #'my-vc-git-mode-line-string)


(provide 'layer-git)
;;; layer-git.el ends here
