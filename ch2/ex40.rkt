(load "book_2-2.rkt")

(define (unique-pairs n)
  (flat-map (lambda (x)
	      (map (lambda (y)
		     (list y x))
		   (enumerate-interval 1 (- x 1))))
	    (enumerate-interval 1 n)))

(unique-pairs 8)

(define (prime-sum-pairs n)
  (map (lambda (x) x)
       (filter prime-sum?
	       unique-pairs)))

(prime-sum-pairs 19)
