;;; dyl-web.el --- web-mode, Vue, and Volar -*- lexical-binding: t; -*-

(use-package web-mode
  :config
  ;; Disable slow features
  (setq web-mode-enable-auto-indentation nil)
  (setq web-mode-enable-auto-quoting nil)
  (setq web-mode-markup-indent-offset 2)  ; template indentation
  (setq web-mode-css-indent-offset 2)     ; CSS indentation
  (setq web-mode-code-indent-offset 2))   ; JavaScript indentation

;; Dedicated vue-mode derived from web-mode
(define-derived-mode vue-mode web-mode "Vue")
(add-to-list 'auto-mode-alist '("\\.vue\\'" . vue-mode))

;; Register Volar for vue-mode.
;; NOTE: :tsdk must point at a JS-based TypeScript (6.x or earlier) that
;; still contains lib/tsserver.js; TypeScript 7 will not work here.
;; Install it with: npm install --prefix ~/.local/share/volar-ts typescript@6
(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               `(vue-mode . ("vue-language-server" "--stdio"
                             :initializationOptions
                             (:typescript
                              (:tsdk ,(expand-file-name
                                       "~/.local/share/volar-ts/node_modules/typescript/lib"))
                              :vue
                              (:hybridMode :json-false))))))

(add-hook 'vue-mode-hook #'eglot-ensure)
(add-hook 'vue-mode-hook #'flymake-mode)

;; Re-enable auto-indentation once the LSP is ready
(defun dyl-web--enable-auto-indentation ()
  "Turn on web-mode auto-indentation in Eglot-managed Vue/web buffers."
  (when (and (bound-and-true-p eglot--managed-mode)
             (derived-mode-p 'web-mode 'vue-mode))
    (setq web-mode-enable-auto-indentation t)))

(add-hook 'eglot-managed-mode-hook #'dyl-web--enable-auto-indentation)

(provide 'dyl-web)
;;; dyl-web.el ends here
