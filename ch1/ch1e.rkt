;; Exercise 1.11

(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
	 (* 2 (f (- n 2)))
	 (* 3 (f (- n 3))))))

;; 0->0
;; 1->1
;; 2->2
;; p = 2; p1 = 1; p2 = 0;
;; for x: 3..n
;;   curr = p + 2 * p1 + 3 * p2
;;   p2 = p1; p1 = p; p = curr

(define (f-loop x n p p1 p2)
  (if (= x n)
      p
      (let ((curr (+ p
		     (* 2 p1)
		     (* 3 p2))))
	(f-loop (+ x 1) n curr p p1))))

(define (f-iter n)
  (if (< n 3)
      n
      (f-loop 3 (+ n 1) 2 1 0)))


;; Exercise 1.12
(define (p-next-line l)
  (cond ((empty? l) '())
	((empty? (cdr l)) l)
	(#t (cons (+ (car l) (cadr l)) (p-next-line (rest l))))))

(p-next-line '(1 4 6 4 1))

(define (dupa l)
  (cond ((empty? l) l)
	(#t (cons (first l) (p-next-line l)))))

(dupa '(1))
;; '(1 1)

(dupa '(1 1))
;; '(1 2 1)

(dupa '(1 2 1))
;; '(1 3 3 1)

(dupa '(1 3 3 1))
;; '(1 4 6 4 1)

(dupa '(1 4 6 4 1))
;; '(1 5 10 10 5 1)

(define (p n l)
  (if (<= (length l) n)
      (cons l (p n (dupa l)))
      '()))

(p 7 '(1))
