(load "flatmap.scm")
(load "enumerate-interval.scm")
(load "filter.scm")
(load "length.scm")
(load "list-append.scm")

(define (queens board-size)
  (define empty-board
	(map (lambda (i)
		   (map (lambda (j) 0) (enumerate-interval 1 board-size)))
		     (enumerate-interval 1 board-size)))
			 
  (define (queen-cols k)
	(if (= k 0)
		(list empty-board)
		(filter
		 (lambda (positions) (safe? k positions))
		 (flatmap
		   (lambda (rest-of-queens)
			(map (lambda (new-row)
					(adjoin-position new-row k rest-of-queens))
				 (enumerate-interval 1 board-size)))
		   (queen-cols (- k 1))))))
  (queen-cols board-size))

(define (adjoin-position i k rest)
	(define (map-i i proc seq)
		(cond ((null? seq) '())
			  ((= i 1) (cons (proc (car seq)) (map-i (- i 1) proc (cdr seq))))
			  (else (cons (car seq) (map-i (- i 1) proc (cdr seq))))))
	(map-i i (lambda (row) (map-i k (lambda (col) 1) row)) rest))

(define (safe? k positions)
	(define (kth k seq)  ;返回seq的第k个的元素
		(if (= k 1)
			(car seq)
			(kth (- k 1) (cdr seq))))
			
	(define (i? i k mat)  ;哪行(i)的第k列有棋子？
		(if (= 1 (kth k (car mat)))
			i
			(i? (+ i 1) k (cdr mat))))
			
	(define (safe?samerow k mat)  ;mat第k行有棋子的同行安全？
		(define (safe?samerow k seq)  ;seq同行安全？
			(cond ((null? seq) true)
				  ((and (not (= k 1)) (= 1 (car seq))) false)		
				  (else (safe?samerow (- k 1) (cdr seq)))))
		(let ((i (i? 1 k mat))) (safe?samerow k (kth i mat))))
		
	(define (d1 i k mat) ;mat(i, k)左上对角线的所有元素
		(if (or (= i 1) (= k 1))
			'()
			(cons (kth (- k 1) (kth (- i 1) mat)) (d1 (- i 1) (- k 1) mat))))
	(define (d2 i k mat) ;mat(i, k)左下对角线的所有元素
	  (let ((size (length mat)))
		(if (or (= i size) (= k 1))
			'()
			(cons (kth (- k 1) (kth (+ i 1) mat)) (d2 (+ i 1) (- k 1) mat)))))
	(define (d3 i k mat) ;mat(i, k)右上对角线的所有元素
	  (let ((size (length mat)))
		(if (or (= i 1) (= k size))
			'()
			(cons (kth (+ k 1) (kth (- i 1) mat)) (d3 (- i 1) (+ k 1) mat)))))
	(define (d4 i k mat) ;mat(i, k)右下对角线的所有元素
	  (let ((size (length mat)))
		(if (or (= i size) (= k size))
			'()
			(cons (kth (+ k 1) (kth (+ i 1) mat)) (d4 (+ i 1) (+ k 1) mat)))))
			
	(define (safe?diagonal k mat)  ;对角线安全？
		(define (have? row)
			(cond ((null? row) true)
				  ((= 1 (car row)) false)
				  (else (have? (cdr row)))))
	  (let ((i (i? 1 k mat)))
			(and (have? (d1 i k mat)) (have? (d2 i k mat))
			 (have? (d3 i k mat)) (have? (d4 i k mat)))))
	
	(and (safe?samerow k positions) (safe?diagonal k positions)))
	  
	  
	