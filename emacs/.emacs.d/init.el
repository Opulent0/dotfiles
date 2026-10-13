;;; init.el --- Dyl's Emacs Configuration -*- lexical-binding: t; -*-

;; Entry point only: package bootstrap, then feature modules from lisp/.
;; Each module owns its own settings, hooks, and keybindings.

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

;; -------------------------------------------------------------
;; Package management
;; -------------------------------------------------------------

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; -------------------------------------------------------------
;; Modules
;; -------------------------------------------------------------

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Order matters:
;;   env        -> PATH must be right before any LSP server starts
;;   ui         -> theme early so nothing flashes unstyled
;;   treesit    -> modes must be mapped before eglot hooks reference them
;;   lsp        -> eglot core + non-web servers
;;   web        -> vue/web-mode, registers Volar with eglot
(require 'dyl-env)
(require 'dyl-ui)
(require 'dyl-editor)
(require 'dyl-treesit)
(require 'dyl-completion)
(require 'dyl-lsp)
(require 'dyl-web)
(require 'dyl-treemacs)
(require 'dyl-git)

;;; init.el ends here
