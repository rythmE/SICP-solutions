
;(define (delay exp)
;  (lambda () exp))
;  ;(memo-proc (lambda ()
;  ; exp)))
;
;(define (force delayed-object)
;  (delayed-object))

(define (memo-proc proc)
  (let ((already-run? false) (result false))
    (lambda ()
      (if (not already-run?)
          (begin (set! result (proc))
                 (set! already-run? true)
                 result)
          result))))

; http://www.cnblogs.com/xiangnan/p/3930359.html
(define-syntax-rule (delay exp) 
    (memo-proc (lambda () exp)))

(define-syntax-rule (cons-stream a b) 
  (cons a (delay b)))

(define-syntax-rule (force delayed-object)
  (delayed-object))


(define (stream-car stream) (car stream))

(define (stream-cdr stream) (force (cdr stream)))

; this won't work as a simple function
;(define (cons-stream a b)
;  (cons a (delay b)))

; This is scheme syntax for macro
; http://stackoverflow.com/questions/5610480/scheme-sicp-r5rs-why-is-delay-not-a-special-form
;(define-syntax cons-stream
;  (syntax-rules ()
;    [(cons-stream x y) (cons x (delay y))]))


(define the-empty-stream '())

(define (stream-null? stream)
  (null? stream))

(define (stream-filter pred stream)
  (cond ((stream-null? stream) the-empty-stream)
        ((pred (stream-car stream))
         (cons-stream (stream-car stream)
                      (stream-filter pred (stream-cdr stream))))
        (else (stream-filter pred (stream-cdr stream)))))

(define (stream-ref s n)
  (if (stream-null? s) the-empty-stream
      (if (= n 0)
          (stream-car s)
          (stream-ref (stream-cdr s) (- n 1)))))

(define (stream-map proc . argstreams)
  (if (stream-null? (car argstreams))
      the-empty-stream
      (cons-stream (apply proc (map stream-car argstreams))
                   (apply stream-map 
                          (cons proc (map stream-cdr argstreams))))))

(define (stream-for-each proc s)
  (if (stream-null? s)
      'done
      (begin (proc (stream-car s))
             (stream-for-each proc (stream-cdr s)))))

; Neil, 2012-05-10
(define (stream-subseq stream a b)
  (cond ((stream-null? stream) the-empty-stream)
        ((= a b) the-empty-stream)
        ((> a b) the-empty-stream)
        (else (cons-stream (stream-ref stream a)
              (stream-subseq stream (+ a 1) b)))))

(define (stream-head stream c)
  (if (= c 0)
      the-empty-stream
      (cons-stream (stream-car stream)
                   (stream-head (stream-cdr stream) (- c 1)))))

(define (display-line x)
  (newline)
  (display x))

(define (display-stream s)
  (stream-for-each display-line s))

; examples
;(let ((x (delay (+ 1 2))))
;  (for ([i (in-range 1 10)])
;            (display (force x))))
;
(define (integers-starting-from n)
  (cons-stream n (integers-starting-from (+ n 1))))

(define integers
  (integers-starting-from 1))

(define (stream-add s n)
  (stream-map (lambda (x)
                (+ x n)) s))

(define (add-streams s1 s2)
  (stream-map + s1 s2))