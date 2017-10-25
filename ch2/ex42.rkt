(load "book_2-2.rkt")

(define (adjoin-position row col positions)
  (cons (list row col) positions))

(define (safe? q positions)
  (empty? (filter (lambda (p)
		    (or (= (car p) (car q))
			(= (- (car p) (car q))
			   (- (cadr p) (cadr q)))))
		  positions)))
	  
  
(define (queens board-size)
  (define (queen-cols k)
    (cond ((= k 0) '(()))
	  (else
	   (filter (lambda (positions)
		     (safe? (car positions) (cdr positions)))
		   (flat-map (lambda (rest-of-queens)
			       (map (lambda (new-row)
				      (adjoin-position new-row k rest-of-queens))
				    (enumerate-interval 1 board-size)))
			     (queen-cols (- k 1)))))))
  (queen-cols board-size))

(first (queens 3))
;; => ((2 3) (3 2) (1 1))

(first (queens 5))
;; => ((4 5) (2 4) (5 3) (3 2) (1 1))

(first (queens 8))
;; => ((5 8) (2 7) (4 6) (7 5) (8 4) (6 3) (3 2) (1 1))

(first (queens 10))
;; => ((4 10) (6 9) (7 8) (2 7) (9 6) (10 5) (8 4) (5 3) (3 2) (1 1))

(first (queens 12))
;; =>


