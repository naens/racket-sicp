(define (make-account n pwd)
    (define pwd-count 0)
    (define (check-pwd str)
        (cond ((eq? str pwd)
               (begin
                   (set! pwd-count 0)
                   #t))
              (#t
               (begin
                   (set! pwd-count (+ pwd-count 1))
                   (if (< pwd-count 7)
                       (error "wrong pwd")
                       (error "too many pwd errors"))))))
    (define (deposit x)
        (set! n (+ n x)))
    (define (withdraw x)
        (if (>= n x)
            (begin
                (set! n (- n x))
                n)
            (error "withdraw too much")))
    (lambda (pwd-str operation)
        (when (check-pwd pwd-str)
            (cond ((eq? operation 'withdraw) withdraw)
                  ((eq? operation 'deposit) deposit)
                  (#t (error "unknown operation"))))))
        