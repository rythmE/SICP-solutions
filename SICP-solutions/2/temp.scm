
(install-scheme-number-package)
(install-rational-package)
(install-polynomial-package)

(define r (make-rational 2 3))

(define p1 (make-polynomial 'x '((2 1)(0 1))))
(define p2 (make-polynomial 'x '((3 1)(0 1))))
(define rf (make-rational p2 p1))