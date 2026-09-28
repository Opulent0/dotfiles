;;; init.el --- Dyl's Emacs Configuration

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

;; =============================================================
;; 1. PACKAGE MANAGEMENT
;; =============================================================

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; =============================================================
;; 2. THEME (load early so nothing flashes unstyled)
;; =============================================================

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'dyl t)

;; =============================================================
;; 3. FONTS & LIGATURES
;; =============================================================

(set-face-attribute 'default nil :font "JetBrainsMono Nerd Font" :height 110)

(use-package ligature
  :config
  (ligature-set-ligatures 't '("==" "!=" ">=" "<=" "->" "=>" "::" ";;"
                               "&&" "||" "..." "++" "--"))
  (global-ligature-mode t))

(use-package nerd-icons)

;; =============================================================
;; 4. GLOBAL EDITOR SETTINGS
;; =============================================================

(setq-default tab-width 4)                             ;; Tab size
(global-display-line-numbers-mode t)                    ;; Display line nums
(setq-default display-fill-column-indicator-column 80) ;; A line at 80 chars
(global-display-fill-column-indicator-mode t)          ;; ^
(setopt treesit-font-lock-level 4)                      ;; treesit level
(setq backup-directory-alist '(                         ;; backups to single dir
                               ("." . "~/.emacs.d/backups")))

;; Ensure Emacs PATH knows where global npm binaries live
(add-to-list 'exec-path "/home/dyl/.npm-global/bin")
(setenv "PATH" (concat "/home/dyl/.npm-global/bin:" (getenv "PATH")))

;; =============================================================
;; 5. TREE-SITTER MODE REMAPS
;; =============================================================

(setq major-mode-remap-alist
      '((yaml-mode       . yaml-ts-mode)
        (bash-mode       . bash-ts-mode)
        (js2-mode        . js-ts-mode)
        (typescript-mode . typescript-ts-mode)
        (json-mode       . json-ts-mode)
        (css-mode        . css-ts-mode)
        (python-mode     . python-ts-mode)
        (go-mode         . go-ts-mode)))

;; =============================================================
;; 6. THE NATIVE PYTHON DOCSTRING FIX
;; =============================================================

(with-eval-after-load 'python
  (setq python--treesit-settings
        (append python--treesit-settings
                (treesit-font-lock-rules
                 :language 'python
                 :feature 'string
                 :override t
                 '(((module (string) @font-lock-doc-face))
                   ((block (string) @font-lock-doc-face)))))))

;; =============================================================
;; 7. VUE MODE DEFINITION & EGLOT (LSP)
;; =============================================================

;; Define dedicated vue-mode derived from web-mode
(define-derived-mode vue-mode web-mode "Vue")
(add-to-list 'auto-mode-alist '("\\.vue\\'" . vue-mode))

;; Global Performance Fixes for LSP JSON Handling
(setq gc-cons-threshold 100000000)          ; 100MB GC Threshold (prevents freeze)
(setq read-process-output-max (* 1024 1024)) ; 1MB buffer size for incoming JSON

(use-package eglot
  :config
  ;; Increase timeout so slow background indexing doesn't trigger "Timed out"
  (setq eglot-request-timeout 30)

  ;; Send changes in batches when idle
  (setq eglot-send-changes-idle-time 0.5)

  ;; Ignore unused heavy features to save CPU
  (setq eglot-ignored-server-capabilities
        '(:documentFormattingProvider
          :documentRangeFormattingProvider
          :semanticTokensProvider
          :codeActionProvider))

  ;; SILENCE JSON LOGGING: Prevents string allocation lag
  ;;(fset 'jsonrpc--log-event #'ignore)

  ;; Register Volar for vue-mode using your npm path
  (add-to-list 'eglot-server-programs
               `(vue-mode . ("vue-language-server" "--stdio"
                             :initializationOptions
                             (:typescript
                              (:tsdk "/home/dyl/.npm-global/lib/node_modules/typescript/lib")
                              :vue
                              (:hybridMode :json-false))))))

;; Enable Eglot on required hooks
(dolist (hook '(python-ts-mode-hook
                go-ts-mode-hook
                bash-ts-mode-hook
                typescript-ts-mode-hook
                css-ts-mode-hook
                vue-mode-hook))
  (add-hook hook #'eglot-ensure))

;; Enable Flymake explicitly in vue-mode
(add-hook 'vue-mode-hook #'flymake-mode)

;; =============================================================
;; 8. YASNIPPET
;; =============================================================

(use-package yasnippet
  :config (yas-global-mode 1))

;; =============================================================
;; 9. WEB-MODE
;; =============================================================

(use-package web-mode
  :config
  ;; Disable slow features
  (setq web-mode-enable-auto-indentation nil) ; Disable auto-indentation
  (setq web-mode-enable-auto-quoting nil)     ; Disable auto-quoting
  (setq web-mode-markup-indent-offset 2)      ; Template indentation
  (setq web-mode-css-indent-offset 2)         ; CSS indentation
  (setq web-mode-code-indent-offset 2))       ; JavaScript indentation

;; Re-enable auto-indentation after LSP is ready
(defun my/enable-web-mode-auto-indentation ()
  (when (and (bound-and-true-p eglot--managed-mode)
             (derived-mode-p 'web-mode 'vue-mode))
    (setq web-mode-enable-auto-indentation t)))

(add-hook 'eglot-managed-mode-hook #'my/enable-web-mode-auto-indentation)

;; =============================================================
;; 10. CORFU (COMPLETION)
;; =============================================================

(use-package corfu
  :config
  (setq corfu-auto t
        corfu-auto-delay 0.3)
  (global-corfu-mode 1))

;; =============================================================
;; 11. TREEMACS
;; =============================================================

(use-package treemacs
  :hook (emacs-startup . treemacs))

(use-package treemacs-nerd-icons
  :config (treemacs-load-theme "nerd-icons"))

;; =============================================================
;; 12. FLYMAKE
;; =============================================================

(add-hook 'emacs-startup-hook #'flymake-show-buffer-diagnostics)
(add-hook 'flymake-diagnostics-buffer-mode-hook
          (lambda () (window-resize (selected-window) 4)))

;; =============================================================
;; 13. MAGIT
;; =============================================================

(use-package magit)

;; =============================================================
;; 14. ACE WINDOW
;; =============================================================

(use-package ace-window
  :bind ("C-x o" . ace-window))

;; Bind a command to switch over to the treemacs window
(global-set-key (kbd "C-c t") #'treemacs-select-window)
(global-set-key (kbd "C-c T") #'treemacs)

(put 'narrow-to-region 'disabled nil)

;;; init.el ends here
