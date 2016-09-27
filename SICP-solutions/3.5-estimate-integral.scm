(load "monte-carlo.scm")

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))
	
(define randx
  (let ((x (random-in-range 2.0 8)))
    (lambda ()
	  (set! x (rand-update x))
	  x)))
	  
(define randy
  (let ((y (random-in-range 4.0 10)))
    (lambda ()
	  (set! y (rand-update y))
	  y)))

(define (P)
  ;(<= (+ (square (- ((randx) 5))) (square (- ((randy) 7)))) 1))
  (<= (+ (square (- (random-in-range 2.0 8) 5))
		 (square (- (random-in-range 4.0 10) 7))) 
	  1))
	
(define (estimate-integral P x1 x2 y1 y2 trials)
  (let ((h (- y2 y1))
		(w (- x2 x1)))
	(* (monte-carlo trials P) (* w h))))