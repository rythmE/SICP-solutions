;;own answer

(load "2.54-equal.scm")

(define (equ? x y) (equal? x y))

;;standard answer

;;for generic package
(define (equ? x y) (apply-generic 'equ? x y))

;;for scheme-number interface
(put 'equ? '(scheme-number scheme-number) (lambda (x y) (= x y)))

;;for rantional interface
(put 'equ? '(rantional rantional) (lambda (x y) (and (= (numer x) (numer y))
													 (= (denom x) (denom y)))))

;;for complex interface
(put 'equ? '(complex complex) (lambda (x y) (and (= (real-part x) (real-part y))
												 (= (imag-part x) (imag-part y)))))


