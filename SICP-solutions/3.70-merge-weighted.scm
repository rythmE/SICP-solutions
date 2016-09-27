(load "add-integers.scm")
(load "3.56-merge.scm")

; 注：这里不能直接用merge的组合方法，因为weight相同的元素不一定本身就是一样的元素，参考3.56-merge.scm
(define (merge-weighted s1 s2 weight)
  (cond ((stream-null? s1) s2)
        ((stream-null? s2) s1)
        (else
         (let ((s1car (stream-car s1))
               (s2car (stream-car s2)))
           (if (< (weight s1car) (weight s2car))
               (cons-stream s1car (merge-weighted (stream-cdr s1) s2 weight))
               (cons-stream s2car (merge-weighted s1 (stream-cdr s2) weight)))))))
							 
							 						 
(define (weighted-pairs s t weight)
  (cons-stream
   (list (stream-car s) (stream-car t))
   (merge-weighted
    (stream-map (lambda (x) (list (stream-car s) x))
                (stream-cdr t))
    (weighted-pairs (stream-cdr s) (stream-cdr t) weight)
    weight)))

(define (w1 pair) (+ (car pair) (cadr pair)))

(define (w2 pair)
  (+ (* (car pair) 2) (* (cadr pair) 3) (* (* (car pair) (cadr pair)) 5)))

(define 370a (weighted-pairs integers integers w1))	

(define 370b (weighted-pairs (stream-cdr S) (stream-cdr S) w2))
