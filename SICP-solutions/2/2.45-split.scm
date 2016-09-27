(define (split big small)
  (lambda (painter n)
	(let ((smaller (split small big)))
	  (big painter (small smaller smaller)))))
	  
(define right-split (split beside below))
(define up-split (split below beside))