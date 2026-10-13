;;; dyl-treemacs.el --- File tree sidebar -*- lexical-binding: t; -*-

(use-package treemacs
  :hook (emacs-startup . treemacs))

(use-package treemacs-nerd-icons
  :config (treemacs-load-theme "nerd-icons"))

(global-set-key (kbd "C-c t") #'treemacs-select-window)
(global-set-key (kbd "C-c T") #'treemacs)

(provide 'dyl-treemacs)
;;; dyl-treemacs.el ends here
