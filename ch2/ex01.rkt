(define (make-rat n d)
  (let ((sign (if (< (* n d) 0) -1 1))
        (g (gcd n d)))
    (cons (/ (* sign (abs n)) g)
          (/ (abs d) g))))

(make-rat -54 -9)
