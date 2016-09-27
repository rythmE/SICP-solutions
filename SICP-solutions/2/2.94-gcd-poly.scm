(load "2.93.scm")

 ;;representation of terms and term lists for poly-package
  (define (gcd-poly p1 p2)
    (if (same-variable? (variable p1) (variable p2))
		(make-polynomial (variable p1) 
						 (gcd-terms (terms p1) (terms p2)))
	    (error "Polys not in same var -- GCD-POLY"
			   (list p1 p2))))
			   
  ;;interface to rest of the system for poly-package
   (put 'greatest-common-divisor '(polynomial polynomial)
		(lambda (p1 p2) (tag (gcd-poly p1 p2))))	
		
  ;;interface to rest of the system for scheme-number-package
   (put 'greatest-common-divisor '(scheme-number scheme-number)
		(lambda (x y) (tag (gcd x y))))
		
  ;;for apply-generic.scm
   (define (greatest-common-divisor x y) 
     (apply-generic 'greatest-common-divisor x y))