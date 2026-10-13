;;; dyl-editor.el --- General editing behavior -*- lexical-binding: t; -*-

(setq-default tab-width 4)

;; Keep backup files out of project directories
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

(put 'narrow-to-region 'disabled nil)

;; Window navigation
(use-package ace-window
  :bind ("C-x o" . ace-window))

(provide 'dyl-editor)
;;; dyl-editor.el ends here
