(load "enumerate-interval.scm")
(load "list-append.scm")

(define (adjoin-term term term-list) 
  (let ((diff (- (order term) (length term-list))))
    (let ((front-a (map (lambda (x) 0) (enumerate-interval 1 (- diff 1)))))
	  (let ((front (cons (coeff term) front-a)))
	    (append front term-list)))))
  
(define (the-empty-termlist) '())
(define (first-term term-list) (car term-list))
(define (rest-terms term-list) (cdr term-list))
(define (empty-termlist? term-list) (null? term-list))

(define (make-term order coeff) (list order coeff))
(define (order term) (car term))
(define (coeff term) (cadr term))