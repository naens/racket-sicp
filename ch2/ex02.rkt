(define (make-segment point1 point2)
  (cons point1 point2))

(define (start-segment segment)
  (if (< (compare-points (car segment) (cdr segment)) 0)
      (car segment)
      (cdr segment)))

(define (compare-points point1 point2)
  (cond ((< (x-point point1) (x-point point2)) -1)
        ((> (x-point point1) (x-point point2)) 1)
        ((< (y-point point1) (y-point point2)) -1)
        ((> (y-point point1) (t-point point2)) 1)
        (#t 0)))

(define (end-segment segment)
  (if (> (compare-points (car segment) (cdr segment)))
      (car segment)
      (cdr segment)))

(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

(define (mid-point-segment segment)
  (mid-point (car segment) (cdr segment)))

(define (mid0-point point1 point2)
  (make-point (avg (x-point point1)
                   (x-point point2))
              (avg (y-point point1)
                   (y-point point2))))
