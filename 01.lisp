;;;; First exercise from project euler: www.projecteuler.net

;;; Task is defined as below:
;;; If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
;;; Find the sum of all the multiples of 3 or 5 below 1000.

;;; Obviously, this is naive and inefficient, education purpose only solution

;;; Defined task specific restrictions
(defvar *maxnum* 1000)     ; Upper limit of number sequence
(defvar *factors* '(3 5))  ; Factors of multiplication

;;; Generates list of ascending integers up to limit 
(defun consecutive-numbers (limit)
    (loop for n from 0 below limit by 1
     collect n))

;;; Filters only multiplies of specified factors from sequence
(defun filter-multiplies-in-seq (seq factors)
 (flet ((is-multiple (n) 
         (some (lambda (divisor) 
                (= 0 (mod n divisor))) 
          factors)))
    (remove-if-not #'is-multiple seq)))


;;; Final sum of multiplies 
(defun main ()
    (let ((multiplies (filter-multiplies-in-seq
                       (consecutive-numbers *maxnum*)
                       *factors*)))
     (print (apply '+ multiplies))))
