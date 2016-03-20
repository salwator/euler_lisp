(defvar *script-name* (nth 1 *posix-argv*))
(defvar *output-file* (nth 2 *posix-argv*))

;;; Optimization policy
(proclaim
 '(optimize
   (compilation-speed 0) (debug 1) (inhibit-warnings 1)
   (safety 1) (space 0) (speed 3)))

;;; Load Lisp file to build
(load *script-name*)

(setf (symbol-function 'timed-main)
 "Print time measures of solution execution"
 (lambda ()
  (time (main)))) 


;;; Make executable
(sb-ext:save-lisp-and-die *output-file*
 :purify t
 :executable t
 :toplevel 'timed-main)
    

