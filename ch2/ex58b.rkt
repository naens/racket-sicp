(define (sum-p l)
  (and (>= (length l) 3)
       (or (eq? (cadr l) '+)
	   (sum-p (cddr l)))))

(sum-p '(1 + 2))			;#t
(sum-p '(4 * 4))			;#f
(sum-p '(1 + 3 * 3))			;#t
(sum-p '(1 * 3 + 3))			;#t
(sum-p '(1 * 3 * 4))			;#f


(define (group-terms l)
  (define (rec rest op prev curr acc)
    (newline)
    (print (format "[rest=~a, prev=~a, curr=~a, acc=~a]" rest prev curr acc))
    (cond ((empty? rest) (if (eq? op '*)
			     (make-product (list prev curr))
			     (cons curr (cons op (cons prev acc)))))
	  ((eq? op '+)
	   (rec (cddr rest) (first rest) curr (second rest) (cons op (cons prev acc))))
	  ((eq? op '*)
	   (rec (cddr rest) (first rest) curr (list prev '* curr) acc))))
  (rec (cdddr l) (second l) (first l) (third l) '()))



(group-terms '(1 + 2 + 7 * 6 + 4))
