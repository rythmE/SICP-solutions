(define (add-poly p1 p2)
  (if (变量相同)
	  直接相加
	  (add-poly (change-var-a2b p1 p2) p2)
	  或者 (add-poly p1 (change-var-a2b p2 p1))
	  除外 直接相加))
		  
(define (change-var-a2b a b)
  递归找到b中与a主变量相同的变量，找到之时，
  将寻找过程中的前一个变量乘到找到变量的系数中去
  对得到的多项式以找到变量为主变量进行合并同类项，
  然后对更高层变量继续此过程，直到找到变量变为主变量为止。)