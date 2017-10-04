(define (product from to fn next)
  (if (= from to)
      1
      (* (fn from)
         (product (next from) to fn next))))

(define (fact n)
  (product 1 (+ n 1) (lambda (x) x) (lambda (x) (+ x 1))))

(fact 4)

(define (prod2 from to fn next)
  (define (rec n acc)
    (if (= n to)
        acc
        (rec (next n) (* (fn n) acc))))
  (rec from 1))

(define (fact2 n)
  (prod2 1 (+ n 1) (lambda (x) x) (lambda (x) (+ x 1))))

(fact2 10)

(define (pi/4 n)
  (prod2 2
         n
         (lambda (x) (if (= (modulo x 2) 0)
                         (/ x (+ x 1))
                         (/ (+ x 1) x)))
         (lambda (x) (+ x 1))))

(define (pi n)
  (* 4.0 (pi/4 n)))

(pi 10000)                              ; 3.1417497371492673
