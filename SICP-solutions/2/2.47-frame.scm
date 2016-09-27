(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin-frame frame) (car frame))

(define (edge1-frame frame) (cadr frame))

(define (edge2-frame frame) (caddr frame))
	
(define (make-frame-c origin edge1 edge2)
  (cons origin (cons edge1 edge2)))
  
(define (origin-frame-c frame) (car frame))

(define (edge1-frame-c frame) (cadr frame))

(define (edge2-frame-c frame) (cddr frame))
  
