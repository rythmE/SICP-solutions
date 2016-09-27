(define (make-accumulator origin)
  (lambda (addend)
    (set! origin (+ origin addend)) 
	origin))