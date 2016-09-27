(define tolerance 0.00001)

(define (fixed-point-p f first-guess)
	(define (close-enough? v1 v2)
		(< (abs (- v1 v2)) tolerance))
	(define (try guess)
		(newline)
		(display guess)
		(let ((next (f guess)))
			(if (close-enough? guess next)
				next
				(try next))))
	(try first-guess))

(define (xx1000-1)
	(fixed-point-p (lambda (x) (/ (log 1000) (log x))) 2))

(define (average x y) (* (/ 1 2) (+ x y)))

(define (xx1000-a)
	(fixed-point-p (lambda (x) (average x (/ (log 1000) (log x)))) 2))