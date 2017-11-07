(load "book_2-3.rkt")

(define (member-p x l)
  (cond ((null? l) #f)
        ((equal? x (car l)) #t)
	(#t (member-p x (cdr l)))))

(define (encode-symbol x tree)
  (cond ((leaf? tree) '())
	((member-p x (symbols (left-branch tree)))
	 (cons 0 (encode-symbol x (left-branch tree))))
	((member-p x (symbols (right-branch tree)))
	 (cons 1 (encode-symbol x (right-branch tree))))
	(#t (error "ERROR"))))

(encode-symbol 'A sample-tree)
;; (0)

(encode-symbol 'B sample-tree)
;; (1 0)

(encode-symbol 'C sample-tree)
;; (1 1 1)

(encode-symbol 'D sample-tree)
;; (1 1 0)

(encode-symbol 'E sample-tree)
;; ERROR

(encode '(A D A B B C A) sample-tree)
;; => (0 1 1 0 0 1 0 1 0 1 1 1 0)
