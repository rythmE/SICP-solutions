(load "accumulate.scm")
(load "enumerate-tree.scm")

(define (conunt-leaves t)
	(accumulate + 0 (map (lambda (x) 1) (enumerate-tree t)))) 