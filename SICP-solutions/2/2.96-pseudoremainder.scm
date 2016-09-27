(load "terms.scm")
(load "exp.scm")
(load "gcd.scm")

;; for poly-package representation of terms and term lists	
(define (gcd-terms a b)
  (if (empty-termlist? b)
	  a
	  (gcd-terms b (pseudoremainder-terms a b))))

(define (pseudoremainder-terms L1 L2)
  (let ((o1 (order (first-term L1)))
		(o2 (order (first-term L2)))
		(c (coeff (first-term L1))))
	(let ((factor-term (make-polynomial 0 (exp c (- (+ 1 o1) o2)))))
	  (cdr (div-terms (mul-terms L1 factor-term) L2)))))
	  
(define (div-factor L1 L2)
  (define (gcd-coeff L)
    (if (null? (rest-terms L))
		(coeff (first-term L))
		(gcd  (coeff (first-term L)) (gcd-coeff L))))
  (let ((g (gcd (gcd-coeff L1) (gcd-coeff L2))))
	(let ((numer (div-terms L1 (make-polynomial 0 g)))
		  (denom (div-terms L2 (make-polynomial 0 g))))
		  (list L1 L2))))