(load "3.74-zero-crossings.scm")

(define (smooth s)
	(stream-map (lambda (x y) (/ (+ x y)))
							s (stream-cdr s))) ; S (cons-stream 0 s)))
							
(define zero-crossings
	(stream-map sign-change-detector 
							(smooth sense-data) 
							(cons-stream 0 (smooth sense-data))))
