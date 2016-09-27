(define (sum? s)
  (第一个符号是+，或者若干个*过后跟一个+))
  
(define (addend s)
 (if (第一个符号是+)
	 (car s)
	 (若干个*的式子各项组成的表l)))

(define (augend s) 
 (if (第一个符号是+)
	 (cddr s)
	 (s中若干个*之后第一个+后面的部分)))
  
(define (product? s)
  (若干个*过后跟一个nil))
  
(define (multiplier p) (car p))

(define (multipliand p) (cddr p))