;;; Exercise 1.1

10
;; 10

(+ 5 3 4)
;; 12

(- 9 1)
;; 8

(/ 6 2)
;; 3

(+ (* 2 4) (- 4 6))
;; 6

(define a 3)
;; #<void>

(define b (+ a 1))
;; #<void>

(+ a b (* a b))
;; 19

(= a b)
;; #f

(if (and (> b a) (< b (* a b)))
    b
    a)
;; 4

(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (#t 25))
;; 16

(+ 2 (if (> b a) b a))
;; 6

(* (cond ((> a b) a)
	 ((< a b) b)
	 (#t -1))
   (+ a 1))
;; 16


;;; Exercise 1.2

(/ (+ 5 4 (- 2 (- 3 (+ 6 4/5))))
   (* 3 (- 6 2) (- 2 7)))
;; -37/150

;;; Exercise 1.3
(define (min-lst_ l a)
  (cond ((empty? l) a)
	((< (first l) a) (min-lst_ (rest l) (first l)))
	(#t (min-lst_ (rest l) a))))
(define (min-lst l)
  (cond ((empty? l) '())
	(#t (min-lst_ (rest l) (first l)))))

(min-lst (list 1))
;; 1

(min-lst (list 1 3))
;; 1

(min-lst (list 3 2 4))
;; 2

(define (remove-first-from-list l e)
  (cond ((empty? l) l)
	((= (first l) e) (rest l))
	(#t (cons (first l) (remove-first-from-list (rest l) e)))))

(remove-first-from-list (list 1 2 3) 1)
;; (2 3)

(remove-first-from-list (list 1 2) 2)
;; (1)

(remove-first-from-list (list 1 3 5 0) 0)
;; (1 3 5)

(define (ex-1.3-proc number-1 number-2 number-3)
  (let ((l (list number-1 number-2 number-3)))
    (apply + (remove-first-from-list l (min-lst l)))))

(ex-1.3-proc 1 7 5)
;; 12

(ex-1.3-proc 9 3 4)
;; 13

(ex-1.3-proc 10 3 8)
;; 18

;;; Exercise 1.4
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(a-plus-abs-b 3 6)
;; 9

(a-plus-abs-b -9 -44)
;; 35

;;; Exercise 1.5
(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))
;; ...


#lang lazy
;; 0

