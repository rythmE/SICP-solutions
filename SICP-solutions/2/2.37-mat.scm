(load "accumulate.scm")
(load "2.36-acc-n.scm")

(define (dot-procuct v w)
	(accumulate + 0 (map * v w)))
	
(define (matrix-*-vector m v)
	(map (lambda (vi mi) (accumulate + 0 (map (lambda (mij) (* vi mij)) mi))) v m))
	
(define (transpose mat)
	(accumulate-n cons '() mat))
	
(define (matrix-*-matrix m n)
	(let ((cols (transpose n)))
		(map (lambda (mi) (map (lambda (colsi) (dot-procuct mi colsi)) cols)) m)))