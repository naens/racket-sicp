(load "book_1-3.rkt")

(define (iterative-improve guess-good-p improve-guess)
  (lambda (guess)
    (define (rec x)
      (if (guess-good-p x)
          x
          (rec (improve-guess x))))
    (rec guess)))

(define (sqrt- x)
  ((iterative-improve
    (lambda (a) (< (abs (- (* a a) x)) 0.001))
    (lambda (guess) (average guess (/ x guess))))
   x))

(sqrt- 5.0)

(define (fixed-point- f first-guess)
  ((iterative-improve
    (lambda (a) (< (abs (- a (f a))) 0.001))
    (lambda (x) (f x)))
   first-guess))

(define (sqrt-- x)
  (fixed-point- (average-damp (lambda (y) (/ x y)))
               1.0))

(sqrt-- 5)
