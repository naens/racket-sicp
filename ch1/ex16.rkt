(define (expta a b n)
  (cond ((= n 0) a)
        ((even? n) (expta a (* b b) (/ n 2)))
        (#t (expta (* a b) b (- n 1)))))


(define (expt-fn b n)
  (expta 1 b n))

(expt-fn 3 2)

(expt-fn 3 8)

