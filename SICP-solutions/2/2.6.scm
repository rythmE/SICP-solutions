(define one (lambda (f) (lambda (x) (f x))))

(define two (lambda (f) (lambda (x) (f (f x)))))

(define (+ a b) (lambda (f) (lambda (x) ((b f) ((a f) x)))))