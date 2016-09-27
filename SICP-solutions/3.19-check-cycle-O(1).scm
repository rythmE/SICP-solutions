(load "2/element-of-set.scm")	;load equal

(define c 1)

(define (count x y)
  (cond ((equal? x y) c)
		(else (set! c (+ c 1))
			  (count (cdr x) y))))
				
(define (check-cycle list)
  (if (not (pair? list))
	  false
      (let ((ind 1))
        (define (check x y)
	      (set! ind (+ ind 1))
		  (set! c 1)
          (cond ((not (pair? y)) false)
				((> ind (count x y)) true)
		        (else (check x (cdr y)))))
		(check (car list) (cdr list)))))