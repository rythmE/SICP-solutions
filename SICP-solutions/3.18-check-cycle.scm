(load "3.17-count-pairs.scm")

(define (check-cycle list)
  (let ((track '()))
    (append-set! track list)
	(cond ((not (pair? list)) false)
	  ((element-of-set? (cdr list) track) true)
	  (else (check-cycle (cdr list))))))