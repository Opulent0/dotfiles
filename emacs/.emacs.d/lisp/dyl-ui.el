;;; dyl-ui.el --- Theme, fonts, and visual chrome -*- lexical-binding: t; -*-

;; Theme
(add-to-list 'custom-theme-load-path (expand-file-name "themes" user-emacs-directory))
(load-theme 'dyl t)

;; Font
(set-face-attribute 'default nil :font "JetBrainsMono Nerd Font" :height 110)

(use-package ligature
  :config
  (ligature-set-ligatures 't '("==" "!=" ">=" "<=" "->" "=>" "::" ";;"
                               "&&" "||" "..." "++" "--"))
  (global-ligature-mode t))

(use-package nerd-icons)

;; Line numbers and fill-column guide
(global-display-line-numbers-mode t)
(setq-default display-fill-column-indicator-column 80)
(global-display-fill-column-indicator-mode t)

(provide 'dyl-ui)
;;; dyl-ui.el ends here
