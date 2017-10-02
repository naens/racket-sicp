
;; returns true if for every a < n (= (% (exp a n) n) (% a n))
(define (proc n)
  (proc-test 0 n))

(define (proc-test a n)
  (cond ((< a n)
         (and (= (% (expt a n) n)
                 (% a n))
              (proc-test (+ a 1) n)))
        (#t #t)))

(define (% a b)
  (remainder a b))

(proc 1105)
