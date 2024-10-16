;; 当第一行是'.LOG'时，Windows notepad会在打开文件后跳转到最后一行，然后插入当前日期时间
;; 这个特性用来写工作日志非常好用，因此写了这个脚本来用emacs实现类似效果

(defun dengjf-winnotepad-dotlog ()
  "Implement the effect of automatically adding date time at the end of the buffer when opening specific file, just like the Windows Notepad."
  (let ((head (buffer-substring-no-properties 1 5))
	(timestamp nil))
    (if (or (string= head ".LOG\n") (string= head ".LOG\r") (string= head ".LOG"))
	(progn
	  (message "dengjf-winnotepad-dotlog: head=%s, matched." head)
	  (goto-char (point-max))
	  (insert (format-time-string "\n%H:%M %Y/%m/%d\n\t"))
	  )
        (message "dengjf-winnotepad-dotlog: head=%s, mismatched" head)
      )))


(provide 'dengjf_winnotepad_dotlog)
