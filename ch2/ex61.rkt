(define (adjoin-set x set)
  (cond ((null? set) `(,x))
	((> x (car set)) (cons (car set) (adjoin-set x (cdr set))))
	(#t (cons x set))))

(adjoin-set 3 '())
;; (3)

(adjoin-set 2 '(3))
;; (2 3)

(adjoin-set 3 '(2 4))
;; (2 3 4)

(adjoin-set 5 '(1 2 3))
;; (1 2 3 5)
