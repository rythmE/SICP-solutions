;;for generic package
(define (negtive x) (apply-generic 'negtive x))

;;for ploy package
(define (sub-poly p1 p2) (add-poly p1 (negtive p2)))

(put 'negtive '(polynomial) 
  (lambda (x) 
    (define (neg p t)
	  (if (empty-termlist? p)
		  t
		  (neg (rest-terms p) 
		    (adjoin-term (make-term (order (first-term p))
									(- 0 (coeff (first-term p))))))))
	(neg x '())))

