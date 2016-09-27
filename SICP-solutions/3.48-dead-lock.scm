(load "rand.scm")

(define (make-account-and-serializer balance)
	(let ((no (random 1000))) ; 错误，可能出现相等的no
		(define (withdraw amount)
			(if (>= balance amount)
					(begin (set! balance (- balance amount))
								 balance)
					"Insufficient funds"))
		(define (deposit amount)
			(set! balance (+ balance amount))
			balance)
		(let ((balance-serializer (make-serializer)))
			(define (dispatch m)
				(cond ((eq? m 'withdraw) withdraw)
							((eq? m 'deposit) deposit)
							((eq? m 'balance) balance)
							((eq? m 'serializer) balance-serializer)
							((eq? m 'get-no) no)
							(else (error "Unknow request -- MAKE-ACCOUNT"
													 m))))
		dispatch)))
	
(define (serialized-exchange account1 account2)
	(if (<= (account1 'get-no) (account12 'get-no)))
			(let ((serializer1 (account1 'serializer))
						(serializer2 (account2 'serializer)))
				((serializer1 (serializer2 exchange))
				 account1
				 account2))
			(let ((serializer1 (account2 'serializer))
						(serializer2 (account1 'serializer)))
				((serializer1 (serializer2 exchange))
				 account2
				 account1)))
				 