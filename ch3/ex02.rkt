(define (make-monitored f)
    (define n 0)
    (lambda (a)
    	(cond ((eq? a 'how-many-calls) n)
    	      ((eq? a 'reset-count) (set! n 0))
    	      (#t (begin
    	      	      (set! n (+ n 1))
    	      	      (f a))))))

    	
