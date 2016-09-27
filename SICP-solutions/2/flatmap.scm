(load "accumulate.scm")
(load "list-append.scm")

(define (flatmap proc seq)
	(accumulate append '() (map proc seq)))