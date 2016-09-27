(load "2.78-tag-without-number.scm")
(load "3.24t-table-put&get.scm")
(load "terms.scm")

;; for poly-package representation of terms and term lists	
(define (gcd-terms a b)
  (if (empty-termlist? b)
	  a
	  (gcd-terms b (remainder-terms a b))))

(define (remainder-terms L1 L2)
  (if (empty-termlist? L1)
	  (the-empty-termlist)
	  (let ((t1 (first-term L1))
			(t2 (first-term L2)))
		(if (> (order t2) (order t1))
			L1
			(let ((new-c (div (coeff t1) (coeff t2)))
				  (new-o (- (order t1) (order t2))))
			  (let ((rest-of-result
					(let ((quotient (adjoin-term (make-term new-o new-c) '())))
					  (remainder-terms (- L1 (* quotient L2)) L2))))
				(cdr rest-of-result)))))))

(define (install-rational-package)
 ;;internal procedures 
  (define (numer x) (car x))
  (define (denom x) (cdr x))
  (define (make-rat n d) 
    (let ((g (gcd-terms n d)))
	  (cons (div-terms n g) (div-terms d g)))) ; 针对poly的更改
  (define (add-rat x y)
	(make-rat (+ (* (numer x) (denom y))
				(* (numer y) (denom x)))
			(* (denom x) (denom y))))
  (define (sub-rat x y)
	(make-rat (- (* (numer x) (denom y))
				(* (numer y) (denom x)))
			(* (denom x) (denom y))))
  (define (mul-rat x y)
	(make-rat (* (numer x) (numer y))
			(* (denom x) (denom y))))
  (define (div-rat x y)
	(make-rat (* (numer x) (denom y))
			(* (denom x) (numer y))))
  (define (equal-rat? x y)
	(= (* (numer x) (denom y))
		(* (numer y) (denom x))))

 ;;interface to rest of the system
  (define (tag x) (attach-tag 'rational x))
  (put 'add '(rational rational)
	   (lambda (x y) (tag (add-rat x y))))
  (put 'sub '(rational rational)
	   (lambda (x y) (tag (sub-rat x y))))
  (put 'mul '(rational rational)
	   (lambda (x y) (tag (mul-rat x y))))
  (put 'div '(rational rational)
	   (lambda (x y) (tag (div-rat x y))))
  
  (put '=zero? '(rantional) 
	   (lambda (x) (and (= (numer x) 0) 
						(not (= (denom x) 0)))))
 
  (put 'make 'rational
	   (lambda (x y) (tag (make-rat x y))))
  'done)
  
(define (make-rational n d)
  ((get 'make 'rational) n d))
