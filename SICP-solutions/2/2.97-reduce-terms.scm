(load "terms.scm")
	  
(define (reduce-terms n d)
  (define (gcd-coeff L)
    (if (null? (rest-terms L))
		(coeff (first-term L))
		(gcd  (coeff (first-term L)) (gcd-coeff L))))
  (let ((g (gcd (gcd-coeff n) (gcd-coeff d))))
	(let ((numer (div-terms n (make-polynomial 0 g)))
		  (denom (div-terms d (make-polynomial 0 g))))
		  (list n d))))
		  
 ;;representation of terms and term lists for poly-package
 (define (reduce-poly p1 p2)
   (if (same-variable? (variable p1) (variable p2))
	   (make-poly (variable p1)
				  (reduce-terms (term-list p1)
								(term-list p2)))
	   (error "Polys not in same var -- REDUCE-POLY"
			  (list p1 p2))))
			  
 ;;interface to rest of the system for poly-package
  (put 'reduce '(polynomial polynomial)
	   (lambda (p1 p2) (tag (reduce-poly p1 p2))))
		  
 ;;representation of terms and term lists for scheme-number-package
 (define (reduce-integers n d)
   (let ((g (gcd n d)))
		(list (/ n g) (/ d g))))
			  
 ;;interface to rest of the system for scheme-number-package
  (put 'reduce '(scheme-number scheme-number)
	   (lambda (x y) (tag (reduce-integers x y))))
			  
 ;; for apply-generic.scm
  (define (reduce x y) (apply-generic 'reduce x y))
  
 ;;internal procedures for raational-package
  ; (load "apply-generic.scm")
  (define (make-rat n d) 
	(let ((g (reduce n d)))
		(cons (car g) (cadr g))))