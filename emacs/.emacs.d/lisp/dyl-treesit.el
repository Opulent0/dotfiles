;;; dyl-treesit.el --- Tree-sitter grammars, modes, and highlighting -*- lexical-binding: t; -*-

;; Where `treesit-install-language-grammar' fetches grammars from.
;; Note: typescript and tsx share one repo; each lives in its own subdir.
(setq treesit-language-source-alist
      '((python "https://github.com/tree-sitter/tree-sitter-python")
        (go "https://github.com/tree-sitter/tree-sitter-go")
        (bash "https://github.com/tree-sitter/tree-sitter-bash")
        (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
        (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
        (css "https://github.com/tree-sitter/tree-sitter-css")
        (json "https://github.com/tree-sitter/tree-sitter-json")
        (yaml "https://github.com/tree-sitter-grammars/tree-sitter-yaml")))

(setopt treesit-font-lock-level 4)

;; Files that nothing else claims need an explicit mapping.
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-ts-mode))
(add-to-list 'auto-mode-alist '("/go\\.mod\\'" . go-mod-ts-mode))
(add-to-list 'auto-mode-alist '("\\.[cm]?ts\\'" . typescript-ts-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-ts-mode))

;; Redirect legacy modes to their tree-sitter equivalents.
(setq major-mode-remap-alist
      '((yaml-mode       . yaml-ts-mode)
        (bash-mode       . bash-ts-mode)
        (js2-mode        . js-ts-mode)
        (typescript-mode . typescript-ts-mode)
        (json-mode       . json-ts-mode)
        (css-mode        . css-ts-mode)
        (python-mode     . python-ts-mode)
        (go-mode         . go-ts-mode)))

;; Python docstring fix: highlight module/block-level strings as docs.
(with-eval-after-load 'python
  (setq python--treesit-settings
        (append python--treesit-settings
                (treesit-font-lock-rules
                 :language 'python
                 :feature 'string
                 :override t
                 '(((module (string) @font-lock-doc-face))
                   ((block (string) @font-lock-doc-face)))))))

(provide 'dyl-treesit)
;;; dyl-treesit.el ends here
