(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
		(begin (set! balance (- balance amount))
				balance)
		"Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
	balance)
  (define (cnt amount) count)
  (define (call-the-cops amount) 
	(display "Calling the cops"))
  (define (dispatch p m)
    (cond ((not (eq? p password)) 
		   (begin (set! count (+ count 1))
				  (if (> count 7)
					  call-the-cops
					  cnt)))
		  ((eq? m 'withdraw) withdraw)
		  ((eq? m 'deposit) deposit)
		  ((eq? m 'reset) (set! count 0) cnt)
		  (else (error "Unknown request -- MAKE-ACCOUNT" m))))
  dispatch)