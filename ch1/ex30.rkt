(define (sum term a next b)
  (define (iter n result)
    (if (= n b)
        result
        (iter (next n) (+ result (term n)))))
  (iter a 0))

(define (identity x) x)

(define (inc a) (+ a 1))
(define (inc2 a) (+ a 2))

(sum identity 5 inc 7)
