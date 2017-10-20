(define nil '())

(define square (lambda (x) (expt x 2)))

(define null null?)
(define consp pair?)
(define t #t)


(define (square-tree1 tree)
  (cond ((null tree) nil)
        ((consp (car tree)) (cons (square-tree1 (car tree))
                                  (square-tree1 (cdr tree))))
        (t (cons (square (car tree))
                 (square-tree1 (cdr tree))))))

(square-tree1 '(1 (2 (3 4) 5) (6 7)))
;; => (1 (4 (9 16) 25) (36 49))

(define (square-tree1a tree)
  (cond ((null tree) nil)
        ((consp tree) (cons (square-tree1a (car tree))
                            (square-tree1a (cdr tree))))
        (t (square tree))))

(square-tree1a '(1 (2 (3 4) 5) (6 7)))
;; => (1 (4 (9 16) 25) (36 49))

(define (square-tree2 tree)
  (map (lambda (sub-tree)
         (cond ((consp sub-tree) (square-tree2 sub-tree))
               (t (square sub-tree))))
       tree))

(square-tree2 '(1 (2 (3 4) 5) (6 7)))
;; => (1 (4 (9 16) 25) (36 49))
