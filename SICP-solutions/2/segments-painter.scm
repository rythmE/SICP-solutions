(load "2.23-for-each.scm")
(load "2.48-segment.scm")
(load "frame-coord-map.scm")

(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
	  (lambda (segment)
	    (draw-line
		  ((frame-coord-map frame) (start-segment segment))
		  ((frame-coord-map frame) (start-segment segment))))
	segment-list)))