(load "1.3.3-fixed-point.scm")

(define (newtons-method g guess)
	(fixed-point (newton-transform g) guess))

(define (newton-transform g)
	(lambda (x)
		(- x (/ (g x) ((deriv g) x)))))

(define (deriv g)
	(lambda (x)
		(/ (- (g (+ x dx)) (g x)) dx)))

(define dx 0.00001)