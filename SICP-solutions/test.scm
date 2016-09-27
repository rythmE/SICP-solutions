;;(cd "d:/code/sicp")
;;(cd "D:/Code/SICP-answers-master/chp3/code")

;;(load "test.scm")

(load "integral-delayed.scm")
(load "3.80-RLC.scm")

(stream-head (car ((RLC 1 1 0.2 0.1) 0 10)) 36)
(stream-head (cdr ((RLC 1 1 0.2 0.1) 0 10)) 36)
