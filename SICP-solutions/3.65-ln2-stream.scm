(load "stream-scale-display.scm")
(load "3.55-partial-sums.scm")
(load "pi-stream.scm")

(define (ln2-summands n)
	(cons-stream (/ 1.0 n)
							 (stream-map - (ln2-summands (+ n 1)))))
							 
(define ln2-stream (partial-sums (ln2-summands 1)))
