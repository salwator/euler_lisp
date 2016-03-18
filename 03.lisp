;;;; Third exercise from project euler: www.projecteuler.net

;;; What is the largest prime factor of the number 600851475143?

;;; Input declaration
(defparameter *tested-number* 600851475143)

;;; Limiting factors of tested number to its square root
(defparameter *factor-limit* (values (ceiling (sqrt *tested-number*))))


;;; Carefull with max size of array in your Lisp
(defun generate-primes-up-to (maxnum)
 "Generates list of prime numbers using Eratosthenes sieve up to maxnum."
 (let (( sieve (make-array (+ 1 maxnum)
                :element-type 'bit
                :initial-element 0)))
    (loop
     for i from 2 to maxnum
     when (equal 0 (bit sieve i))
     collect i
     do (loop for n from (* i i) to maxnum by i
         do (setf (bit sieve n) 1)))))



(defun collect-first-factor (seq num)
 "Collects first factor of num from number list in seq" 
 (when seq)
    (let (( divisor (car seq)))
        (if (equal 0 (rem num divisor))
            divisor
            (collect-first-factor (cdr seq) num))))



;;; MAIN function for executable build
(defun main()
 (let ((factors (reverse (generate-primes-up-to *factor-limit*))))
    (print (collect-first-factor factors *tested-number*))))
