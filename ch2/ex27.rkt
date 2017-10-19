(define nil '())

(define (deep-reverse l)
  (define (rec tmp acc)
    (cond ((null? tmp) acc)
          ((pair? (car tmp)) (rec (cdr tmp) (cons (deep-reverse (car tmp)) acc)))
          (#t (rec (cdr tmp) (cons (car tmp) acc)))))
  (rec l nil))

(deep-reverse '(1 (2) 3 (4 5) (6 7 8)))
;; => ((8 7 6) (5 4) 3 (2) 1)
