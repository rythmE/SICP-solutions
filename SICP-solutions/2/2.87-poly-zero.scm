;;for generic package
(define (=zero? x) (apply-generic '=zero? x))

;;for ploy interface
(put '=zero? '(polynomial) (lambda (x) (eq? x '())))