(define (accumulate combiner null-value term a next b)
  (if (= a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (identity x) x)

(define (inc a) (+ a 1))

(sum identity 0 inc 4)

(define (mult term a next b)
  (accumulate * 1 term a next b))

(mult identity 1 inc 5)

(define (accumulate-iter combiner null-value term a next b)
  (define (rec n acc)
    (if (= n b)
        acc
        (rec (next n) (combiner acc (term n)))))
  (rec a null-value))

(define (sum2 term a next b)
  (accumulate-iter + 0 term a next b))

(sum2 identity 0 inc 5)

(define (mult2 term a next b)
  (accumulate-iter * 1 term a next b))

(mult2 identity 1 inc 5)

(define (m10 x) (* x 10))

(sum2 m10 0 inc 6)
