;;;; Problem 5 from Project Euler : projecteuler.net

;;; What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?


;;; Generating primes just as in Problem 3
(defun generate-primes-up-to (maxnum)
 "Generates list of prime numbers using Eratosthenes sieve up to maxnum."
 (declare (type fixnum maxnum))
 (let (( sieve (make-array (+ 1 maxnum)
                :element-type 'bit
                :initial-element 0)))
    (loop
     for i from 2 to maxnum
     when (equal 0 (bit sieve i))
     collect i
     do (loop for n from (* i i) to maxnum by i
         do (setf (bit sieve n) 1)))))

;;; We're gonna need primes with their exponents as factors
(defstruct factor (prime  1 :type fixnum)
                  (exponent 0 :type fixnum))

;;; Maths for finding those exponents out
(defun calculate-exponent (max-factor prime)
 "Calculates how many times given prime factor must occur"
 (declare (type fixnum max-factor prime))
 (values (floor (/ (log max-factor)
                   (log prime)))))

(defun factor-of-prime (max-factor prime)
 "Get prime and its exponent for maximum factor"
 (declare (type fixnum max-factor prime))
 (make-factor :prime prime
              :exponent (calculate-exponent max-factor prime)))

(defun calculate-factors (max-factor)
 (declare (type fixnum max-factor))
 (mapcar (lambda (p) (factor-of-prime max-factor p))
  (generate-primes-up-to max-factor)))

(defun multiply-factors (factors)
 "Multiplies powered factors in list"
 (if factors
    (let ((factor (car factors)))
          (* (expt (factor-prime factor) 
                   (factor-exponent factor))
             (multiply-factors (cdr factors))))
  1))


;;; MAIN function for executable

(defparameter *max-num* 20)

(defun main ()
 (time
    (let ((max-factor *max-num*))
    (print (multiply-factors (calculate-factors max-factor))))))

