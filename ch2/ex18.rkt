(define (rev l)
  (define (rec l a)
    (cond ((null? l) a)
          (#t (rec (cdr l) (cons (car l) a)))))
  (rec l '()))

(reverse '(a b c))
;; (c b a)

(reverse '(a b))
;; (b a)

(reverse '(b))
;; (b)

(reverse '())
;; ()
