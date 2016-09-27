(define (make-vect x y) (cons x y))

(define (xcor-vect v) (cons (car v) 0))

(define (ycor-vect v) (cons 0 (cdr v)))

(define (add-vect v1 v2) (cons (+ (car (xcor-vect v1)) (car (xcor-vect v2)))
							   (+ (cdr (ycor-vect v1)) (cdr (ycor-vect v2)))))

(define (sub-vect v1 v2) (cons (- (car (xcor-vect v1)) (car (xcor-vect v2))) 
							   (- (cdr (ycor-vect v1)) (cdr (ycor-vect v2)))))

(define (scale-vect v s) (cons (* s (car (xcor-vect v))) (* s (cdr (ycor-vect v)))))