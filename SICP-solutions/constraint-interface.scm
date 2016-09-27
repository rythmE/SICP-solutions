	
(define (inform-about-value constraint)
	(constraint 'I-have-a-value))	
	
(define (inform-about-no-value constraint)
	(constraint 'I-lost-my-value))
	
(define (has-value? connector)
	(connector 'has-value?))	
	
(define (get-value connector)
	(connector 'get-value))	
	
(define (set-value! connector new-value informant)
	((connector 'set-value!) new-value informant))
	
(define (forget-value! connector retractor)
	((connector 'forget) retractor))
	
(define (connect connector new-constraint)
	((connector 'connect) new-constraint))