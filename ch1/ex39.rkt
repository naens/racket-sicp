(define (tan-cf x k)
  (define (rec i)
    (if (> i k)
        (* x x)
        (- (- (* 2 i) 1)
           (/ (* x x)
              (rec (+ i 1))))))
  (/ x (rec 1)))

(tan (/ pi 6))
(tan-cf (/ pi 6) 10)

(tan (/ pi 4))
(tan-cf (/ pi 4) 10)

(tan (/ pi 3))
(tan-cf (/ pi 3) 10)
