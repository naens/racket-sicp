(define (map-iter f items)
  (define (rec l a)
    (cond ((null? l) a)
          (#t (rec (cdr l) (cons (f (car l)) a)))))
  (reverse (rec items '())))

(define (square x)
  (* x x))

(define (square-list3 items)
  (map-iter square items))

(square-list3 '(1 2 3 4 5))
;; => (1 4 9 16 25)
