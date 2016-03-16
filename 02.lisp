;;;; Second exercise from project euler: www.projecteuler.net

;;; By considering the terms in the Fibonacci sequence whose values do not exceed four million,
;;; find the sum of the even-valued terms.

;;; loop version of fibbonacci

(defvar *maxnum* 4000000)  ; limit of fibbonacci sequence

;;; calculate next fibbonacci element
(defun next-fibb (seq)
 (apply '+ (subseq seq 0 2)))

;;; Fibbonacci sequence up to max-element
(defun fibb-sequence (max-element)
    (let ((fibb        '(1 1)))
        (loop for i from 1
              until (> (car fibb)
                       max-element)
              do (setf fibb
                       (cons (next-fibb fibb) fibb))
              finally (return (cdr fibb)))))

;;; Leave even-valued elements
(defun filter-even-only (seq)
 (remove-if-not #'evenp seq))

;;; Sum all even-valued elements of fibbonacci sequence up to max-element
(defun sum-even-fibb (max-element)
 (apply '+ (filter-even-only
            (fibb-sequence max-element))))

;;; main function to run in executable
(defun main ()
 (print (sum-even-fibb *maxnum*)))
