(define (cont-frac n d k)
  (define (rec i)
    (cond ((> i k) 0)
          (#t (/ (n i)
                 (+ (d i)
                    (rec (+ i 1)))))))
  (rec 1))

(define phi (/ (+ 1 (sqrt 5)) 2))

(/ 1 phi)

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           14)


(define (cont-frac2 n d k)
  (define (rec i acc)
    (cond ((<= i 0) acc)
          (#t (rec (- i 1)
                   (/ (n i)
                      (+ (d i)
                         acc))))))
  (rec k 0))

(cont-frac2 (lambda (i) 1.0)
            (lambda (i) 1.0)
            14)
