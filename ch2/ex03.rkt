(load "ex02.rkt")

(define (rectangle-perimeter rectangle)
  (* 2 (+ (rectangle-h rectangle) (rectangle-w rectangle))))

(define (rectangle-area rectangle)
  (* (rectangle-h rectangle) (rectangle-w rectangle)))

(define (make-rectangle point1 point2)
  (cons poin1 point2))

(define (rectangle-h rectangle)
  (abs (- (y-point (car rectangle))
          (y-point (cdr rectangle)))))

(define (rectangle-w rectangle)
  (abs (- (x-point (car rectangle))
          (x-point (cdr rectangle)))))
