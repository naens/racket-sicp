#lang sicp
(load "book_1-3.rkt")

(define (integral-sr f a b n)
  (define h (/ (- b a) n))
  (define (y k) (f (+ a (* k h))))
  (define (sr-term k)
    (* (if (or (= k 0) (= k n))
           1
           (* 2 (+ 1 (remainder k 2))))
       (y k)))
  (* (/ h 3)
     (sum sr-term 0 inc n)))


(integral-sr cube 0.0 1.0 10000)
