(define (make-point x y) (cons x y))

(define (x-point p) (car p))

(define (y-point p) (cdr p))

(define (make-ret-2 start center) (cons start center))

(define (get-start r) (car r))

(define (get-center r) (cdr r))

(define (get-height-2 r) (* 2 (abs (- (y-point (get-start r))
									(y-point (get-center r))))))

(define (get-width-2 r) (* 2 (abs (- (x-point (get-start r))
									(x-point (get-center r))))))

(define (perimeter-2 r) (* 2 (+ (get-height-2 r) (get-width-2 r))))

(define (area-2 r) (* (get-height-2 r) (get-width-2 r)))

(define (print-ret-2 r)
	(newline)
	(display "peremeter is ")
	(display (perimeter-2 r))
	(newline)
	(display "area is ")
	(display (area-2 r)))