(define (higher? t1 t2)
  (define (level t) 
    (cond ((eq? t 'complex) 1)
		  ((eq? t 'real) 2)
		  ((eq? t 'rational) 3)
		  ((eq? t 'integer) 4)))
  (< (level t1) (level t2)))

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
	  (if proc
		  (apply proc (map contents args))
		  (if (= (length args) 2)
			  (let ((type1 (car type-tags))
					(type2 (cadr type-tags))
					(a1 (car args))
					(a2 (cadr args)))
				(if (not (eq? type1 type2))
					(let ((t1->t2 (get-coercion type1 type2))
						  (t1->t2 (get-coercion type1 type2)))
					  (cond ((higher? t2 t1)
							 (apply-generic op (t1->t2 a1) a2))
							((higher? t1 t2)
							 (apply-generic op a1 (t2->t1 a2)))
							(else
							 (error "No method for these types"
									(list op type-tags)))))
					(error "No method for these types"
							(list op type-tags)))
			  (error "No method for these types"
					 (list op type-tags))))))))