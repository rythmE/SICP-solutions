
(define (stream-limit s c)
	(let ((s1 (stream-car s))
				(s2 (stream-car (stream-cdr s)))
		(let (diff (abs (- s1 s2)))
			(if (>= diff c)
					(stream-limit (stream-cdr s) c)
					s2)))))

(define (sqrt x tolerance)
	(stream-limit (sqrt-stream x) tolerance))