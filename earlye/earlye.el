(defun ede-get-extension (name)
  (replace-regexp-in-string
   ".*\\."
   ""
   name
   )
  )

(defun ede-insert-file-header( )
  (interactive)
  (setq extension (ede-get-extension (buffer-name)))
  )

(defun ede-insert-buffer-name( )
  (interactive)
  (insert (buffer-name) )
  )

(defun ede-make-symbol (name)
  (replace-regexp-in-string
   "[\.\*]" "_"
   name
   )
  )

(defun ede-buffer-name-symbol ( )
  (upcase (ede-make-symbol (buffer-name)))
  )

(defun ede-rtrim ( str )
  (replace-regexp-in-string "[ \n\t\r]*$" "" str )
  )

(defun ede-ltrim ( str )
  (replace-regexp-in-string "^[ \t]*" "" str )
  )

(defun ede-trim ( str )
  ( ede-ltrim ( ede-rtrim str ) )
  )

(defun ede-insert-uuid( )
  (interactive)
  (setq id (ede-trim (shell-command-to-string "uuidgen" ) ))
  (insert id)
  )

(defun ede-insert-uuid-hex( )
  (interactive)
  (setq id (ede-trim (shell-command-to-string "uuidgen | sed \"s/^/\\(0x/g;s/-/,0x/g;s/$/\\)/g\"" ) ))
  (insert id)
  )

(defun ede-insert-translate-selection( )
  (interactive)
  (setq fnName (concat "str" (ede-trim (shell-command-to-string "uuidgen | sed s/-//g" )) "()"))
  (goto-char (region-end)) (insert (concat ");\n}\n  static std::string " fnName ";\n"))
  (goto-char (region-beginning)) (insert (concat "translations::" fnName "\nstd::string translations::" fnName "\n{\n  return tr("))
  )

(defun ede-insert-cpp-header-guard ( )
  (interactive)
  (setq id (ede-trim (concat (ede-buffer-name-symbol) (shell-command-to-string "uuidgen | sed s/-/_/g ") )))
  (setq curYear (ede-trim (shell-command-to-string "date +%Y")))
  (beginning-of-buffer)
  (insert (concat "#ifndef " id "\n"
                  "#define " id "\n"
                  "\n// Copyright " curYear " " user-full-name "\n"
                  "\n"))

  (end-of-buffer)
  (insert (concat
           "\n"
           "#endif /* ndef " id " */\n\n" ))
  )

(defun iwb ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max))
  )


(provide 'earlye)
