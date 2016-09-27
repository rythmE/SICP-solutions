;;own answer

(define (=zero? x)
  (let ((tag (type-tag x))
	(cond ((eq? tag 'scheme-number) (= (content x) 0))
		  ((eq? tag 'rational) (and (= (car (content x)) 0))
									(not (= (cdr (content x)) 0)))
		  ((eq? tag 'complex) (and (= (cadr (content x)) 0))
								   (= (caddr (content x)) 0))))))
								   
;;standard answer

;;for generic package
(define (=zero? x) (apply-generic '=zero? x))

;;for scheme-number interface
(put '=zero? '(scheme-number) (lambda (x) (= x 0)))

;;for rantional interface
(put '=zero? '(rantional) (lambda (x) (and (= (numer x) 0)
										   (not (= (denom x) 0)))))

;;for complex interface
(put '=zero? '(complex) (lambda (x y) (and (= (real-part x) 0)
										   (= (imag-part x) 0))))						   