#lang sicp

(load "book_1-2-6.rkt")

(define (expmod2 base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (let ((sqx (square (expmod base (/ exp 2) m))))
                      (if (= (remainder sqx m) 1)
                          0
                          sqx))
                    m))
        (#t (remainder (* base (expmod base (- exp 1) m))
                       m))))
(fast-prime? 137 3)
