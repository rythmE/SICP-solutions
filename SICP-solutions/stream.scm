
; 有问题，不能正常实现（比如练习3.51）
; 跟 http://www.gnu.org/software/mit-scheme/documentation/mit-scheme-ref/Streams.html#Streams 不一样

(define (cons-stream x y) (cons x (delay y)))

(define (stream-car stream) (car stream))

(define (stream-cdr stream) (force (cdr stream)))

(define (force delayed-object) (delayed-object))

(define (delay proc) (memo-proc (lambda() proc)))

(define (memo-proc proc)
	(let ((already-run? false) (result false))
		(lambda ()
			(if (not already-run?)
					(begin (set! result (proc))
								 (set! already-run? true)
								 result)
					result))))
					
(define (display-stream s)
	(stream-for-each display-line s))
	
(define (display-line x)
	(newline)
	(display x))
	
(define (stream-ref s n)
	(if (= n 0)
			(stream-car s)
			(stream-ref (stream-cdr s) (- n 1))))
			
(define (stream-map proc s)
	(if (stream-null? s)
			the-empty-stream
			(cons-stream (proc (stream-car s))
									 (stream-map proc (stream-cdr s)))))
									 
(define (stream-for-each proc s)
	(if (stream-null? s)
			'done
			(begin (proc (stream-car s))
						 (stream-for-each proc (stream-cdr s)))))
						 
(define (stream-enumerate-interval low high)
	(if (> low high)
			the-empty-stream
			(cons-stream
				low
				(stream-enumerate-interval (+ low 1) high))))
						 
(define (stream-filter pred stream)
	(cond ((stream-null? stream) the-empty-stream)
				((pred (stream-car stream))
				 (cons-stream (stream-car stream)
											(stream-filter prod
																		 (stream-cdr stream))))
				(else (stream-filter pred (stream-cdr stream)))))