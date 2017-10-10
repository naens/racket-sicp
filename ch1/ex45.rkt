(load "book_1-3.rkt")

(load "ex43.rkt")

(define (minad n)
  (if (< n 2)
      0
      (+ 1 (minad (/ n 2)))))

(minad 3)

(define (root n x)
  (fixed-point ((repeated average-damp (minad n)) (lambda (y) (/ x (expt y (- n 1)))))
               1.0))


(root 4 16)
