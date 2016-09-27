

(define (integral-err delayed-integrand initial-value dt) ; integral-err err表示错误的解法
	(cons-stream initial-value
							 (let ((integrand (force delayed-integrand))) ; (这里与参考答案有差别)
								 (if (stream-null? integrand)
										 the-empty-stream
										 (integral (stream-cdr integrand) ; (delay (stream-cdr integrand))
															 (+ (* dt (stream-car integrand))
																	initial-value)
															 dt)))))
															 
(define (integral delayed-integrand initial-value dt)
	(cons-stream initial-value
							 (if (stream-null? delayed-integrand)
									 the-empty-stream
									 (let ((integrand (force delayed-integrand)))
										 (integral (delay (stream-cdr integrand))
															 (+ (* dt (stream-car integrand))
																	initial-value)
															 dt)))))

(define (solve f y0 dt)
	(define y (integral (delay dy) y0 dt))
	(define dy (stream-map f y))
	y)