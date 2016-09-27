(load "3.66-pair-integers.scm")
(load "stream-scale-display.scm")

(define (triples s t u)
	(cons-stream
		(list (stream-car s) (stream-car t) (stream-car u))
		(interleave
			(stream-cdr (stream-map (lambda (x) (append (list (stream-car s)) x))
															(pairs t u)))
			(triples (stream-cdr s) (stream-cdr t) (stream-cdr u)))))

;参考答案
(define (triples-2 s t u)
  (cons-stream
   (list
    (stream-car s)
    (stream-car t)
    (stream-car u))
   (interleave
    (stream-map
     (lambda (x) (append (list (stream-car s)) x))
     (stream-cdr (pairs t u)))
    (triples
     (stream-cdr s)
     (stream-cdr t)
     (stream-cdr u)))))
			
;这个不行			
;(define (pythagoras s t u)
	;(define (pytha triple)
		;(let (((car triple) i)
					;((cadr triple) j)
					;((caddr triple) k))
			;(= (sqrt k) (+ (sqrt i) (sqrt j)))))
	;(stream-filter pytha (triples s t u)))
	
(define (pythagoras s t u)
	(define (pytha? triple)
		(= (square (caddr triple)) 
			 (+ (square (car triple)) (square (cadr triple)))))
	(stream-filter pytha? (triples s t u)))