(load "transform-painter.scm")
(load "2.46-vect.scm")

(define (flip-horiz painter)
  (transform-painter painter
					 (make-vect 1.0 0.0)
					 (make-vect 0.0 0.0)
					 (make-vect 1.0 1.0)))

(define (ccw-rotate180 painter)
  (transform-painter painter
					 (make-vect 1.0 1.0)
					 (make-vect 0.0 1.0)
					 (make-vect 1.0 0.0)))

(define (ccw-rotate270 painter)
  (transform-painter painter
					 (make-vect 1.0 0.0)
					 (make-vect 1.0 1.0)
					 (make-vect 0.0 0.0)))					 