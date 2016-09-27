(load "transform-painter.scm")
(load "2.46-vect.scm")

(define (below painter1 painter2)
  (let ((split-point (make-vect 0.0 0.5)))
    (let ((paint-bottom
		   (transform-painter painter1
							 (make-vect 0.0 0.0)
							 (make-vect 1.0 0.0)
							 split-point))
		  (paint-top
		   (transform-painter painter2
							 split-point
							 (make-vect 1.0 0.5)
							 (make-vect 0.0 1.0))))
	  (lambda (frame)
	    (paint-bottom painter1)
		(paint-top painter2)))))
		
(define (cw-rotate90 painter)
  (transform-painter painter
					 (make-vect 1.0 0.0)
					 (make-vect 1.0 1.0)
					 (make-vect 0.0 0.0))
					 
(define (ccw-rotate90 painter)
  (transform-painter painter
					 (make-vect 0.0 1.0)
					 (make-vect 0.0 0.0)
					 (make-vect 1.0 1.0))
					 
(define (beside painter1 painter2)
  (let ((split-point (make-vect 0.5 0.0)))
    (let ((paint-left
		   (transform-painter painter1
							 (make-vect 0.0 0.0)
							 split-point
							 (make-vect 0.0 1.0)))
		  (paint-right
		   (transform-painter painter2
							 split-point
							 (make-vect 1.0 0.0)
							 (make-vect 0.5 1.0))))
	  (lambda (frame)
	    (paint-left painter1)
		(paint-right painter2)))))				 
					 
(define (below-r painter1 painter2)
	(ccw-rotate90 (beside (cw-rotate90 painter1) (cw-rotate90 painter2)))