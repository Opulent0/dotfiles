;;; dyl-completion.el --- Completion and snippets -*- lexical-binding: t; -*-

(use-package corfu
  :config
  (setq corfu-auto t
        corfu-auto-delay 0.3)
  (global-corfu-mode 1))

(use-package yasnippet
  :config (yas-global-mode 1))

(provide 'dyl-completion)
;;; dyl-completion.el ends here
