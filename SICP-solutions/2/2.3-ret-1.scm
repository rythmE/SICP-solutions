(define (make-ret start height width)
	(cons start (cons height width)))
	
(define (get-height r) (car (cdr r)))

(define (get-width r) (cdr (cdr r)))

(define (start-point r) (car r))

(define (make-point x y) (cons x y))

(define (x-point p) (car p))

(define (y-point p) (cdr p))

(define (perimeter r) (* 2 (+ (get-height r) (get-width r))))

(define (area r) (* (get-height r) (get-width r)))

(define (print-ret r)
	(newline)
	(display "peremeter is ")
	(display (perimeter r))
	(newline)
	(display "area is ")
	(display (area r)))