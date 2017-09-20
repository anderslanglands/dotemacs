;;; layer-git --- Git and VC setup

;;; Commentary:

;;; Code:
(message "Loading layer-git...")

(use-package magit :ensure t
  :defer t
  :config
  (use-package evil-magit :ensure t)
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
