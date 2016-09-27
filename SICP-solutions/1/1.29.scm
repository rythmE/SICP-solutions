(define (cube x) (* x x x))

(define (sum1 term y next k n)
	(if (< k 0)
		0
		(if (or (= k 0) (= k n))
			(+ (term y) (sum1 term (next y) next (- k 1) n))
			(if (odd? k)
				(+ (* 4 (term y)) (sum1 term (next y) next (- k 1) n))
				(+ (* 2 (term y)) (sum1 term (next y) next (- k 1) n))))))

(define (integral1 f a b n)
	(define h (/ (- b a) n))
	(define cnt n)
	(define (add-kh x) (+ x h))
	(* (/ h 3.0) (sum1 f a add-kh cnt n)))