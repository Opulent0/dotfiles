;;; dyl-env.el --- PATH setup for external tools -*- lexical-binding: t; -*-

;; The Emacs daemon runs as a systemd user service and does not inherit
;; the shell's PATH, so tool directories are added explicitly here.

(defun dyl-env--add-to-path (dir)
  "Prepend DIR to both `exec-path' and the PATH environment variable."
  (let ((expanded (expand-file-name dir)))
    (add-to-list 'exec-path expanded)
    (setenv "PATH" (concat expanded ":" (getenv "PATH")))))

(dyl-env--add-to-path "~/.npm-global/bin") ; global npm binaries
(dyl-env--add-to-path "~/go/bin")          ; Go tools (gopls, etc.)

(provide 'dyl-env)
;;; dyl-env.el ends here
