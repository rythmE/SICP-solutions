

(define m (list (list 1 2 3 4) (list 5 6 7 8) (list 9 10 11 12) (list 13 14 15 16)))
(define q (list (list 1 0 0 1) (list 0 1 0 0) (list 0 0 0 0) (list 0 0 1 0)))
(define sa (list (list 1 0 0 0) (list 0 0 0 1) (list 0 1 0 0) (list 0 0 1 0)))
(define v (list 1 2 3 4))

(load "2.41-s-sum-triples.scm")
(load "2.46-vect.scm")
(load "2.47-frame.scm")
(load "2.49-painters.scm")

(cd "d:/code/sicp")

(safe?diagonal 1 q)

(define v (make-vect 2 4))

(define a-frame (make-frame v 1 1))

(define frame (make-frame-c v 1 2))