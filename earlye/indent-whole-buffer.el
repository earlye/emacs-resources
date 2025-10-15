(defun iwb ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (if (not 'indent-tabs-mode)
      (untabify (point-min) (point-max)))
  (set-buffer-file-coding-system 'utf-8-unix)
  )
