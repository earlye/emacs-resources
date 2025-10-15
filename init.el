(defun ede_load (name)
  (let ((filename (concat (file-name-directory (or load-file-name (buffer-file-name))) name)))
    (load filename))
  )

(global-display-line-numbers-mode 1)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(set-face-foreground 'minibuffer-prompt "yellow")

(ede_load "init-melpa.el") ;; has to come before other packages so they can load properly

(ede_load "init-keyboard.el")
(ede_load "init-treesitter.el")
(ede_load "init-yaml-mode.el")
(ede_load "earlye/indent-whole-buffer.el")
(ede_load "init-compilation-colors.el")

(defun hack-local-variables-make-interactive (&rest _args)
  "Just add the `interactive'-specification to `hack-local-variables'."
  (interactive))

(advice-add 'hack-local-variables :before #'hack-local-variables-make-interactive)
