(load "weight-set.scm")

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))
  
(define (successive-merge pairs)
  (if (null? (cdr pairs))
	  (car pairs)
	  (let ((new (adjoin-set (make-code-tree (car pairs) (cadr pairs))
							 (cddr pairs))))
		(successive-merge new))))