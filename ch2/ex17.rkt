(define (last-pair l)
  (cond ((null? (cdr l)) (car l))
        (#t (last-pair (cdr l)))))

(last-pair '(a))
;; a

(last-pair '(a b c))
;; c
