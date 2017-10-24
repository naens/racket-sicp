(load "ex40.rkt")

(define (triples n)
  (flat-map (lambda (x)
	      (map (lambda (y)
		     (cons y x))
		   (enumerate-interval 1 (- (car x) 1))))
	    (unique-pairs n)))

(triples 5)

	      
