(defvar *script-name* (nth 1 *posix-argv*))
(defvar *output-file* (nth 2 *posix-argv*))

(load *script-name*)

(sb-ext:save-lisp-and-die *output-file*
 :executable t
 :toplevel 'main)
