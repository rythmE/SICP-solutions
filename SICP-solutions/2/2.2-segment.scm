(define (midpoint-segment l)
	(define (average a b) (* (/ 1 2) (+ a b)))
	(let ((mid-x (average (x-point (start-segment l))
						(x-point (end-segment l))))
		(mid-y (average (y-point (start-segment l))
						(y-point (end-segment l)))))
		(cons mid-x mid-y)))
	
(define (make-segment start end) (cons start end))

(define (start-segment l) (car l))

(define (end-segment l) (cdr l))

(define (make-point x y) (cons x y))

(define (x-point p) (car p))

(define (y-point p) (cdr p))

(define (print-point p)
	(newline)
	(display "(")
	(display (x-point p))
	(display ",")
	(display (y-point p))
	(display ")"))