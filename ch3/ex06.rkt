(define nrnd
    (let ((counter 0))
        (define (generate) 
            (set! counter (modulo (+ 1234 (* counter 177)) 12345))
            counter)
        (lambda (op)
            (cond ((eq? op 'generate) (generate))
                  ((eq? op 'reset) (lambda (n) (set! counter n)))
    	          (#t (error "unknown operation"))))))
