(define (mult a b)
  (cond ((or (<= a 0) (<= b 0)) 0)
        ((= b 1) a)
        ((even? b) (mult (+ a a) (/ b 2)))
        (#t (+ a (mult a (- b 1))))))

(mult 6 3)

(mult 7 14)
