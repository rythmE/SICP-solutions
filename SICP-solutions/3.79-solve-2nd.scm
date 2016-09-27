(load "integral-delayed.scm")

(define (solve-2nd-err a b dt y0 dy0)
	(define y (integral (delay dy) y0 dt))
	(define dy (integral (delay ddy) dy0 dt))
	(define ddy (stream-map f (scale-stream dy (/ 1 dt)) y))
	y)
	
(define (solve-2nd a b dt y0 dy0)
	(define y (integral (delay dy) y0 dt))
	(define dy (integral (delay ddy) dy0 dt))
	(define ddy (stream-map f dy y))
	y)

