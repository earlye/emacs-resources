(ede_load "yaml-mode/yaml-mode.el")

(setq yaml-mode-hook
      '(lambda() (progn
                   (subword-mode)
                   (set-variable 'show-trailing-whitespace t)
                   (add-hook 'before-save-hook
                             (lambda()
                               (progn
                                 (delete-trailing-whitespace)))
                             nil t)
                   )))
