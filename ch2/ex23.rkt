(define (for-each- f items)
  (when (not (empty? items))
    (f (car items))
    (for-each f (cdr items)))
  #t)

(for-each (lambda (x) (display (* x 10)))
          '(1 2 3 4 5))
;;=> #t
;;
;; 1020304050
