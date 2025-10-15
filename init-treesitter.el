(require 'treesit)

(message "enabling treesit-auto...")

;; https://github.com/renzmann/treesit-auto
(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (delete 'yaml treesit-auto-langs)
  (global-treesit-auto-mode))
(message "treesit-auto-langs: `%s'" treesit-auto-langs)

(dolist (lang treesit-auto-langs)
  (progn
    (setq mode (format "%s-ts-mode" lang))
    (setq mode-hook-name (format "%s-hook" mode))
    (add-hook
     (intern mode-hook-name) ;; convert from the string "foo-ts-mode-hook" to the symbol 'foo-ts-mode-hook
     '(lambda()
	(progn
	  (message "running hook for mode %s" mode)
	  (subword-mode)
          (add-hook 'before-save-hook
                    (lambda()
                      (progn
                        (delete-trailing-whitespace)))
                    )
	  )
	)
     )
    (message "lang: %s mode: %s mode-hook: %s" lang mode mode-hook-name)
    )
  )
