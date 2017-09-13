(define (mult-iter acc a b)
  (cond ((= b 0) acc)
        ((even? b) (mult-iter acc (+ a a) (/ b 2)))
        (#t (mult-iter (+ acc a) a (- b 1)))))

(define (do-mult a b)
  (mult-iter 0 a b))

(do-mult 3 3)

(do-mult 1 99)

(do-mult 99 1)

(do-mult 0 9123)

(do-mult 123 0)

(do-mult 134499 34234525)



