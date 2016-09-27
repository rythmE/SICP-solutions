(load "3.66-pair-integers.scm")

(define (pairs-all s t)
	(cons-stream
		(list (stream-car s) (stream-car t))
		(interleave
			(interleave (stream-map (lambda (x) (list (stream-car s) x))
															(stream-cdr t))
									(stream-map (lambda (x) (list x (stream-car t)))
															(stream-cdr s)))
			(pairs (stream-cdr s) (stream-cdr t)))))

			
; 网上答案 https://wizardbook.wordpress.com/2010/12/22/exercise-3-67/
(define (pairs-all2 s t) 
  (cons-stream
   (list (stream-car s) (stream-car t))
   (interleave
    (stream-map (lambda (x) 
                  (list (stream-car s) x))
                (stream-cdr t))
    (interleave 
     (stream-map (lambda (x) 
                  (list x (stream-car t)))
                 (stream-cdr s))
     (pairs (stream-cdr s) (stream-cdr t))))))