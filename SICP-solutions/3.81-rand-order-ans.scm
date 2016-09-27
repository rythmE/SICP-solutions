; 参考答案，来自https://wizardbook.wordpress.com/2010/12/23/exercise-3-81/

;Some of the utilities for handling random numbers

(define initial-seed 317)
(define (rand-update)
  (random (expt 2 31)))
 
(define (random-init seed)
  (random-seed seed)
  (rand-update))
	
;Next, generating an infinite random-stream from a seed value

(define (rand seed requests)
  (define (rand-iter randoms actions)
    (if (stream-null? actions) 
        null
        (let ((request (stream-car actions)))
          (cond ((eq? 'generate request)
                 (cons-stream (stream-car randoms)
                              (rand-iter (stream-cdr randoms) 
                                         (stream-cdr actions))))
                ((eq? 'reset request)
                 (let ((new-randoms (random-stream (random-init seed)))) 
                   (cons-stream (stream-car new-randoms)
                                (rand-iter (stream-cdr new-randoms) 
                                           (stream-cdr (stream-cdr actions))))))
                (else (error "RAND -- unknown request" request))))))
  (rand-iter (random-stream (random-init seed)) 
             requests))
 
; (show-stream (rand (list->stream (list 'generate 'generate 'generate))) 3)
; 1423959383
; 653588942
; 1694290797
; done
 
; (show-stream (rand (list->stream 
		; (list 'generate 'generate 'generate 'reset 
					; 'generate 'generate 'generate))) 6)
; 1423959383
; 653588942
; 1694290797
; 1423959383
; 653588942
; 1694290797
; done