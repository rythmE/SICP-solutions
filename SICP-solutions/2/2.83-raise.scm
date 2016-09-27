(define (integer->rational n) (make-rational n 1))

(define (rational->real n) (make-real (/ (+ (car (contents n)) 0.0) (cadr (contents n)))))

(define (real->complex n) (make-complex-from-real-imag (contents n) 0))

(define (integer-to-rat x) ((get-coercion 'integer 'rational) x))

(define (rat-to-real x) ((get-coercion 'rational 'real) x))

(define (real-to-complex x) ((get-coercion 'real 'complex) x))

(define (raise x) 
  (let ((type (type-tag x))
    (cond ((eq? type 'integer) 
			((get-coercion 'integer 'rational) x))
		  ((eq? type 'rational) 
			((get-coercion 'rational 'real) x))
		  ((eq? type 'real) 
			((get-coercion 'real 'complex) x))
		  (else x)))))