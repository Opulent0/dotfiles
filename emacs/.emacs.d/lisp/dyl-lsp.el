;;; dyl-lsp.el --- Eglot, language servers, and diagnostics -*- lexical-binding: t; -*-

;; Performance: LSP exchanges large JSON payloads.
(setq gc-cons-threshold 100000000)           ; 100MB, prevents GC freezes
(setq read-process-output-max (* 1024 1024)) ; 1MB buffer for incoming JSON

(defun dyl-lsp--tsc-contact (&rest _)
  "Return the command for the nearest project-local native tsc LSP server.
TypeScript 7 is the native Go port: it speaks LSP itself and no longer
ships tsserver.js, so typescript-language-server cannot wrap it.
Searching upward from the file handles monorepo layouts where
node_modules sits above the file's own directory."
  (let* ((dir (and buffer-file-name
                   (locate-dominating-file buffer-file-name
                                           "node_modules/.bin/tsc")))
         (tsc (and dir (expand-file-name "node_modules/.bin/tsc" dir))))
    (if tsc
        (list tsc "--lsp" "--stdio")
      (user-error "No node_modules/.bin/tsc found above %s" buffer-file-name))))

(use-package eglot
  :config
  ;; Slow background indexing shouldn't trigger "Timed out"
  (setq eglot-request-timeout 30)

  ;; Batch changes while idle
  (setq eglot-send-changes-idle-time 0.5)

  ;; Skip heavy features to save CPU
  (setq eglot-ignored-server-capabilities
        '(:documentFormattingProvider
          :documentRangeFormattingProvider
          :semanticTokensProvider
          :codeActionProvider))

  ;; SILENCE JSON LOGGING: prevents string allocation lag
  ;; (fset 'jsonrpc--log-event #'ignore)

  ;; Native TypeScript server (needs Eglot >= 1.20 for pull diagnostics).
  (add-to-list 'eglot-server-programs
               '(((typescript-ts-mode :language-id "typescript")
                  (tsx-ts-mode :language-id "typescriptreact"))
                 . dyl-lsp--tsc-contact)))

;; Start Eglot automatically in these modes (vue-mode is hooked in dyl-web).
(dolist (hook '(python-ts-mode-hook
                go-ts-mode-hook
                bash-ts-mode-hook
                typescript-ts-mode-hook
                tsx-ts-mode-hook
                css-ts-mode-hook))
  (add-hook hook #'eglot-ensure))

;; Diagnostics panel
(add-hook 'emacs-startup-hook #'flymake-show-buffer-diagnostics)
(add-hook 'flymake-diagnostics-buffer-mode-hook
          (lambda () (window-resize (selected-window) 4)))

(provide 'dyl-lsp)
;;; dyl-lsp.el ends here
