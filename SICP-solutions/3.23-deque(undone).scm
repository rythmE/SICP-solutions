

(define (front-ptr deque)
    (caar deque))

(define (rear-ptr deque)
    (cdar deque))
	
(define (set-front-ptr! deque item)
    (set-car! (car deque) item))

(define (set-rear-ptr! deque item)
    (set-cdr! (car deque) item))

(define (empty-deque? deque)
    (null? (front-ptr deque)))

(define (make-deque)
    (cons '() '()))

(define (front-deque deque)
    (if (empty-deque? deque)
        (error "FRONT called with an empty deque" deque)
        (car (front-ptr deque))))
		
(define (rear-deque deque)
    (if (empty-deque? deque)
        (error "REAR called with an empty deque" deque)
        (car (rear-ptr deque))))

(define (front-insert-deque! deque item)
    (let ((new-pair (cons item '())))
        (cond ((empty-deque? deque)
                (set-front-ptr! deque new-pair)
                (set-rear-ptr! deque new-pair)
                deque)
              ((= (rear-ptr deque) (front-ptr deque))
                (set-cdr! new-pair (front-deque deque))
                (set-front-ptr! deque new-pair)
                deque))))
              (else
                (set-cdr! new-pair (front-deque deque))
                (set-front-ptr! deque new-pair)
                deque))))

(define (rear-insert-deque! deque item)
    (let ((new-pair (cons item '())))
        (cond ((empty-deque? deque)
                (set-front-ptr! deque new-pair)
                (set-rear-ptr! deque new-pair)
                deque)
              (else
                (set-cdr! (rear-ptr deque) new-pair)
                (set-rear-ptr! deque new-pair)
                deque))))

(define (front-delete-deque! deque)
    (cond ((empty-deque? deque)
            (error "DELETE! called with an empty deque" deque))
          (else
            (set-front-ptr! deque (cdr (front-ptr deque)))
            deque)))

(define (rear-delete-deque! deque)
    (cond ((empty-deque? deque)
            (error "DELETE! called with an empty deque" deque))
			;**undone**))