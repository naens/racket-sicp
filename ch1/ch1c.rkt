;; Exercise 1.9
(define (+ a b)
  (if (= a 0) b (inc (+ (dec a) b))))

(+ 4 5)
(if (= 4 0) 5 (inc (+ 3 5)))
(inc (if (= 3 0) 5 (inc (+ 2 5))))
(inc (inc (if (= 2 0) 5 (inc (+ 1 5)))))
(inc (inc (inc (if (= 1 0) 5 (inc (+ 0 5))))))
(inc (inc (inc (inc (if (= 0 0) 5 (inc (+ -1 5)))))))
(inc (inc (inc (inc 5))))
(inc (inc (inc 6)))
(inc (inc 7))
(inc 8)
9

(define (+ a b)
  (if (= a 0) b (+ (dec a) (inc b))))

(+ 4 5)
(if (= 4 0) 5 (+ 3 6))
(if (= 3 0) 6 (+ 2 7))
(if (= 2 0) 7 (+ 1 8))
(if (= 1 0) 8 (+ 0 9))
(if (= 0 0) 9 (+ -1 10))
9

;; Exercise 1.10
(define (A x y)
  (cond ((= y 0) 0)
	((= x 0) (* 2 y))
	((= y 1) 2)
	(#t (A (- x 1)
	       (A x (- y 1))))))

(A 1 10)
;; 1024

(A 2 4)
;; 65536

(A 3 3)
;; 65536

(define (f n) (A 0 n))
(define (f2 n) (* 2 n))

(define (g n) (A 1 n))
(cond ((= n 0) 0)
      ((= n 1) 2)
      (#t (A 0 (A 1 (- n 1)))))
(cond ((= n 0) 0)
      ((= n 1) 2)
      (#t (* 2 (g (- n 1)))))
;; 0->0 1->2 3->4 4->8 5->16 (if (= n 0) 0 (exp n 2))

(define (h n) (A 2 n))
(A 1 (A 2 (- n 1)))
(A 0 (A 1 (- (A 2 (- n 1)) 1)))
(* 2 (A 1 (- (A 2 (- n 1)) 1)))
;; ????????
