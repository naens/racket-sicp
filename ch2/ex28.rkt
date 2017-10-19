(define (fringe l)
  (define (rec tmp acc)
    (cond ((null? tmp) acc)
          ((pair? (car tmp)) (rec (cdr tmp) (append (reverse (fringe (car tmp))) acc)))
          (#t (rec (cdr tmp) (cons (car tmp) acc)))))
  (reverse (rec l '())))

(fringe '(1 2 (3 (4 5)) 6 (7 (((8)) 9)) 0))

(define (fringe2 l)
  (define (rec tmp acc)
    (cond ((null? tmp) acc)
          ((pair? (car tmp)) (rec (cdr tmp) (rec (car tmp) acc)))
          (#t (rec (cdr tmp) (cons (car tmp) acc)))))
  (reverse (rec l '())))

(fringe2 '(1 2 (3 (4 5)) 6 (7 (((8)) 9)) 0))
