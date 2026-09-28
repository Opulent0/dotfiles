;;; dyl-theme.el --- Monochrome theme with dodger blue highlights

(deftheme dyl
  "Near-mono dark theme. Black background, white text, dodger blue for identifiers,
gray comments, with bold/italic/bold-italic variations for keywords and structure.")

(custom-theme-set-faces
 'dyl

 ;; === Core ===
 '(default                          ((t (:foreground "#ffffff" :background "#000000"))))
 '(cursor                           ((t (:background "#1e90ff"))))
 '(fringe                           ((t (:background "#000000"))))
 '(line-number                      ((t (:foreground "#555555" :background "#000000"))))
 '(line-number-current-line         ((t (:foreground "#888888" :background "#000000" :bold t))))
 '(hl-line                          ((t (:background "#101010"))))
 '(region                           ((t (:background "#1e3a5f"))))
 '(secondary-selection              ((t (:background "#0d2540"))))
 '(minibuffer-prompt                ((t (:foreground "#1e90ff" :bold t))))
 '(vertical-border                  ((t (:foreground "#222222"))))
 '(window-divider                   ((t (:foreground "#222222"))))
 '(trailing-whitespace              ((t (:background "#330000"))))
 '(match                            ((t (:foreground "#000000" :background "#1e90ff"))))

 ;; =============================================================
 ;; === Font lock   generic (fallback for all modes) ===
 ;; =============================================================

 ;; Variables, function names, type names, properties   dodger blue
 '(font-lock-variable-name-face     ((t (:foreground "#1e90ff" :weight thin t))))
 '(font-lock-variable-use-face      ((t (:foreground "#ffffff" ))))
 '(font-lock-function-name-face     ((t (:foreground "#1e90ff" ))))
 '(font-lock-function-call-face     ((t (:foreground "#efffff" ))))
 '(font-lock-type-face              ((t (:foreground "#1e90ff" :slant italic t :weight bold t))))
 '(font-lock-property-name-face     ((t (:foreground "#ffffff" ))))
 '(font-lock-property-use-face      ((t (:foreground "#ffffff" ))))

 ;; Primitives / constants / builtins
 '(font-lock-constant-face          ((t (:foreground "#1e90ff"))))
 '(font-lock-builtin-face           ((t (:foreground "#ddffff" :italic t))))

 ;; Numbers   mint green
 '(font-lock-number-face            ((t (:foreground "#0069D1"))))

 ;; Keywords   white bold
 '(font-lock-keyword-face           ((t (:foreground "#ffffff" :weight bold t))))

 ;; Strings   mint green italic
 '(font-lock-string-face            ((t (:foreground "#0069D1"))))

 ;; Doc strings   gray italic
 '(font-lock-doc-face               ((t (:foreground "#666666" :slant oblique t))))
 '(font-lock-doc-markup-face        ((t (:foreground "#555555" :slant italic t))))

 ;; Comments   gray
 '(font-lock-comment-face           ((t (:foreground "#666666" :slant oblique t))))
 '(font-lock-comment-delimiter-face ((t (:foreground "#555555"))))

 ;; Preprocessor / warnings   white bold italic
 '(font-lock-preprocessor-face      ((t (:foreground "#ffffff" :bold t :italic t))))
 '(font-lock-warning-face           ((t (:foreground "#ffffff" :bold t :italic t))))

 ;; Operators / punctuation   white
 '(font-lock-operator-face          ((t (:foreground "#ffffff"))))
 '(font-lock-punctuation-face       ((t (:foreground "#ffffff"))))
 '(font-lock-negation-char-face     ((t (:foreground "#ffffff" :bold t))))
 '(font-lock-escape-face            ((t (:foreground "#ffffff" :bold t))))
 '(font-lock-misc-punctuation-face  ((t (:foreground "#ffffff"))))
 '(font-lock-delimiter-face         ((t (:foreground "#ffffff"))))
 '(font-lock-bracket-face           ((t (:foreground "#ffffff"))))

 ;; =============================================================
 ;; === Tree-sitter generic faces (Emacs 29+ *-ts-mode) ===
 ;; =============================================================

 '(treesit-font-lock-variable-name-face ((t (:foreground "#1e90ff"))))
 '(treesit-font-lock-variable-use-face  ((t (:foreground "#1e90ff"))))
 '(treesit-font-lock-function-name-face ((t (:foreground "#1e90ff"))))
 '(treesit-font-lock-function-call-face ((t (:foreground "#1e90ff"))))
 '(treesit-font-lock-type-face          ((t (:foreground "#1e90ff"))))
 '(treesit-font-lock-property-name-face ((t (:foreground "#1e90ff"))))
 '(treesit-font-lock-property-use-face  ((t (:foreground "#1e90ff"))))
 '(treesit-font-lock-constant-face      ((t (:foreground "#1e90ff"))))
 '(treesit-font-lock-builtin-face       ((t (:foreground "#1e90ff"))))
 ;; Numbers   mint green
 '(treesit-font-lock-number-face        ((t (:foreground "#3FFFA8"))))
 ;; Strings   mint green italic
 '(treesit-font-lock-string-face        ((t (:foreground "#3FFFA8" :italic t))))
 '(treesit-font-lock-escape-face        ((t (:foreground "#ffffff" :bold t))))
 '(treesit-font-lock-keyword-face       ((t (:foreground "#aaeeff" :bold t))))
 '(treesit-font-lock-operator-face      ((t (:foreground "#ffffff"))))
 '(treesit-font-lock-punctuation-face   ((t (:foreground "#ffffff"))))
 '(treesit-font-lock-bracket-face       ((t (:foreground "#ffffff"))))
 '(treesit-font-lock-delimiter-face     ((t (:foreground "#ffffff"))))
 '(treesit-font-lock-misc-punctuation-face ((t (:foreground "#ffffff"))))
 '(treesit-font-lock-comment-face       ((t (:foreground "#666666"))))
 '(treesit-font-lock-comment-delimiter-face ((t (:foreground "#555555"))))
 ;; Doc strings   gray italic
 '(treesit-font-lock-doc-face           ((t (:foreground "#666666" :italic t))))
 '(treesit-font-lock-doc-markup-face    ((t (:foreground "#555555" :italic t))))
 '(treesit-font-lock-warning-face       ((t (:foreground "#ffffff" :bold t :italic t))))

 ;; =============================================================
 ;; === Python (python-mode) ===
 ;; =============================================================

 '(python-quoted-expression-face    ((t (:foreground "#3FFFA8" :italic t))))
 '(python-string-interpolation-face ((t (:foreground "#3FFFA8" :italic t))))

 ;; =============================================================
 ;; === Go (go-mode) ===
 ;; =============================================================

 '(go-identifier-face               ((t (:foreground "#1e90ff"))))
 '(go-string-face                   ((t (:foreground "#3FFFA8" :italic t))))

 ;; =============================================================
 ;; === web-mode (Vue SFCs, HTML, Jinja, etc.) ===
 ;; =============================================================

 '(web-mode-string-face             ((t (:foreground "#3FFFA8" :italic t))))
 '(web-mode-variable-name-face      ((t (:foreground "#1e90ff"))))
 '(web-mode-function-name-face      ((t (:foreground "#1e90ff"))))
 '(web-mode-function-call-face      ((t (:foreground "#1e90ff"))))
 '(web-mode-type-face               ((t (:foreground "#1e90ff"))))
 '(web-mode-constant-face           ((t (:foreground "#1e90ff"))))
 '(web-mode-builtin-face            ((t (:foreground "#1e90ff"))))
 '(web-mode-keyword-face            ((t (:foreground "#aaeeff" :bold t))))
 '(web-mode-comment-face            ((t (:foreground "#666666"))))
 '(web-mode-doctype-face            ((t (:foreground "#555555"))))
 '(web-mode-html-tag-face           ((t (:foreground "#ffffff" :bold t))))
 '(web-mode-html-tag-bracket-face   ((t (:foreground "#ffffff"))))
 '(web-mode-html-attr-name-face     ((t (:foreground "#1e90ff"))))
 '(web-mode-html-attr-value-face    ((t (:foreground "#3FFFA8" :italic t))))
 '(web-mode-block-face              ((t (:background "#080808"))))
 '(web-mode-symbol-face             ((t (:foreground "#1e90ff"))))
 '(web-mode-preprocessor-face       ((t (:foreground "#ffffff" :bold t :italic t))))

 ;; =============================================================
 ;; === TypeScript (typescript-mode, tide) ===
 ;; =============================================================

 '(typescript-this-face             ((t (:foreground "#ffffff" :bold t))))
 '(typescript-access-modifier-face  ((t (:foreground "#ffffff" :bold t))))
 '(typescript-primitive-face        ((t (:foreground "#3FFFA8"))))

 ;; js2-mode
 '(js2-function-param               ((t (:foreground "#1e90ff"))))
 '(js2-external-variable            ((t (:foreground "#1e90ff"))))
 '(js2-jsdoc-tag                    ((t (:foreground "#888888"))))
 '(js2-jsdoc-type                   ((t (:foreground "#1e90ff"))))
 '(js2-jsdoc-value                  ((t (:foreground "#1e90ff"))))
 '(js2-error                        ((t (:underline (:style wave :color "#ff4444")))))
 '(js2-warning                      ((t (:underline (:style wave :color "#888888")))))

 ;; =============================================================
 ;; === sh-mode / shell-script-mode (bash) ===
 ;; =============================================================

 '(sh-heredoc                       ((t (:foreground "#3FFFA8" :italic t))))
 '(sh-quoted-exec                   ((t (:foreground "#3FFFA8"))))
 '(sh-variable                      ((t (:foreground "#1e90ff"))))

 ;; =============================================================
 ;; === Mode line ===
 ;; =============================================================

 '(mode-line                        ((t (:foreground "#ffffff" :background "#111111" :box (:line-width 1 :color "#333333")))))
 '(mode-line-inactive               ((t (:foreground "#555555" :background "#080808" :box (:line-width 1 :color "#1a1a1a")))))
 '(mode-line-buffer-id              ((t (:foreground "#1e90ff" :bold t))))
 '(mode-line-highlight              ((t (:foreground "#ffffff" :background "#1e3a5f"))))

 ;; =============================================================
 ;; === Search ===
 ;; =============================================================

 '(isearch                          ((t (:foreground "#000000" :background "#1e90ff" :bold t))))
 '(isearch-fail                     ((t (:foreground "#ffffff" :background "#440000"))))
 '(lazy-highlight                   ((t (:foreground "#000000" :background "#0d5fa0"))))

 ;; =============================================================
 ;; === Diff / Magit ===
 ;; =============================================================

 '(diff-added                       ((t (:foreground "#aaffaa" :background "#001a00"))))
 '(diff-removed                     ((t (:foreground "#ffaaaa" :background "#1a0000"))))
 '(diff-changed                     ((t (:foreground "#aaaaff" :background "#00001a"))))
 '(diff-header                      ((t (:foreground "#888888"))))
 '(diff-file-header                 ((t (:foreground "#ffffff" :bold t))))
 '(diff-hunk-header                 ((t (:foreground "#1e90ff"))))

 '(magit-section-heading            ((t (:foreground "#1e90ff" :bold t))))
 '(magit-section-highlight          ((t (:background "#0a0a0a"))))
 '(magit-diff-added                 ((t (:foreground "#aaffaa" :background "#001a00"))))
 '(magit-diff-removed               ((t (:foreground "#ffaaaa" :background "#1a0000"))))
 '(magit-diff-added-highlight       ((t (:foreground "#ccffcc" :background "#002a00"))))
 '(magit-diff-removed-highlight     ((t (:foreground "#ffcccc" :background "#2a0000"))))
 '(magit-diff-hunk-heading          ((t (:foreground "#888888" :background "#0a0a0a"))))
 '(magit-diff-hunk-heading-highlight((t (:foreground "#aaaaaa" :background "#111111"))))
 '(magit-branch-local               ((t (:foreground "#1e90ff"))))
 '(magit-branch-remote              ((t (:foreground "#aaaaaa"))))
 '(magit-hash                       ((t (:foreground "#555555"))))
 '(magit-log-author                 ((t (:foreground "#1e90ff"))))

 ;; =============================================================
 ;; === Flycheck / Flymake ===
 ;; =============================================================

 '(flycheck-error                   ((t (:underline (:style wave :color "#ff4444")))))
 '(flycheck-warning                 ((t (:underline (:style wave :color "#888888")))))
 '(flycheck-info                    ((t (:underline (:style wave :color "#1e90ff")))))
 '(flymake-error                    ((t (:underline (:style wave :color "#ff4444")))))
 '(flymake-warning                  ((t (:underline (:style wave :color "#888888")))))
 '(flymake-note                     ((t (:underline (:style wave :color "#1e90ff")))))

 ;; =============================================================
 ;; === Completion ===
 ;; =============================================================

 '(completions-common-part          ((t (:foreground "#1e90ff" :bold t))))
 '(completions-first-difference     ((t (:foreground "#ffffff" :bold t))))

 ;; =============================================================
 ;; === Org mode ===
 ;; =============================================================

 '(org-level-1                      ((t (:foreground "#ffffff" :bold t :height 1.15))))
 '(org-level-2                      ((t (:foreground "#ffffff" :bold t))))
 '(org-level-3                      ((t (:foreground "#ffffff" :italic t))))
 '(org-level-4                      ((t (:foreground "#cccccc"))))
 '(org-code                         ((t (:foreground "#1e90ff"))))
 '(org-verbatim                     ((t (:foreground "#1e90ff"))))
 '(org-block                        ((t (:foreground "#ffffff" :background "#080808"))))
 '(org-block-begin-line             ((t (:foreground "#555555"))))
 '(org-block-end-line               ((t (:foreground "#555555"))))
 '(org-link                         ((t (:foreground "#1e90ff" :underline t))))
 '(org-todo                         ((t (:foreground "#1e90ff" :bold t))))
 '(org-done                         ((t (:foreground "#555555" :bold t))))
 '(org-date                         ((t (:foreground "#1e90ff"))))
 '(org-tag                          ((t (:foreground "#888888"))))
 '(org-table                        ((t (:foreground "#aaaaaa"))))
 '(org-meta-line                    ((t (:foreground "#555555"))))
 '(org-document-title               ((t (:foreground "#ffffff" :bold t :height 1.3))))

 ;; =============================================================
 ;; === Misc UI ===
 ;; =============================================================

 '(link                             ((t (:foreground "#1e90ff" :underline t))))
 '(link-visited                     ((t (:foreground "#5aaaff" :underline t))))
 '(button                           ((t (:foreground "#1e90ff" :underline t))))
 '(header-line                      ((t (:foreground "#888888" :background "#080808"))))
 '(tooltip                          ((t (:foreground "#ffffff" :background "#111111"))))
 '(shadow                           ((t (:foreground "#555555"))))
 '(success                          ((t (:foreground "#1e90ff" :bold t))))
 '(warning                          ((t (:foreground "#aaaaaa" :bold t))))
 '(error                            ((t (:foreground "#ff4444" :bold t))))
 )

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-directory load-file-name)))

(provide-theme 'dyl)

;;; dyl-theme.el ends here
