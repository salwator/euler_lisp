;;;; Problem 4 from Project Euler : projecteuler.net

;;; A palindromic number reads the same both ways. 
;;; The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
;;; Find the largest palindrome made from the product of two 3-digit numbers.

 

(defun num-to-list (num)
 "Coverts number to list of digits"
 (coerce (prin1-to-string num) 'list))

(defun slice (lst begin end)
 "Gets slice from list [begin,end] when indexes go from 1 to legth of lst"
 (subseq lst (max 0 (1- begin)) 
             (min (length lst) end)))

(defun list-is-palindrome (digit-list)
 "Checks list is a palindrome"
 (let* ((      size (length digit-list))
        (slice-size (floor (/ size 2))))
     (equal (slice digit-list 1 slice-size)
            (reverse (slice digit-list (1+ (- size slice-size)) size)))))

(defun palindrome? (num)
 "Checks if number is a palindrome"
 (list-is-palindrome (num-to-list num)))


(defun flatten (l)
 "Just flatten given nested list"
 (cond ((null l) nil)
       ((atom l) (list l))
       (t (loop for a in l appending (flatten a)))))


(defun all-products (max-num min-num)
 "Produces list of all products (1 to max-num) x (1 to max-num)"
 (flatten (loop for i from max-num downto min-num
           collect (flet ((multiplicate (x) (* x i)))
                    (mapcar #'multiplicate
                            (loop
                             for k from max-num downto i
                             collect k)))))) 


(defun find-biggest-palindrome (number-seq)
 "Finds biggest of palindromes in unordered number-seq"
 (find-if #'palindrome? (sort number-seq #'>)))


;;; MAIN function for executable

(defun main()
 (time (let ((   big 999)
             ( small 100))
      (print (find-biggest-palindrome (all-products big small))))))
