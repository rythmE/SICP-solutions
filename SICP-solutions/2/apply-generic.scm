(load "2.78-tag-without-number.scm")
(load "3.24t-table-put&get.scm")

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
	  (if proc
		  (apply proc (map contents args))
		  (error 
		    "No method for these types -- APPLY-GENERIC"
			(list op type-tags))))))
					 
(define (=zero? x) (apply-generic '=zero? x))
(define (add x y) (apply-generic 'add x y))
(define (sub x y) (apply-generic 'sub x y))
(define (mul x y) (apply-generic 'mul x y))
(define (div x y) (apply-generic 'div x y))