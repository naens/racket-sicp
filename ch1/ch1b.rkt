(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
		 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (abs x)
  (cond ((> x 0) x)
	((= x 0) 0)
	((< x 0) (- x))))

(define (srfn x)
  (sqrt-iter 1.0 x))

(~r (srfn 7) #:precision 2)

;; Exercise 1.7
(define (good-enough? guess x)
  (< (abs (- (square guess) x))
     (* guess 0.01)))

(~r (srfn 0.01) #:precision 2)


;; Exercise 1.8

(define (do-cube appr x)
  (/ (+ (/ x (square appr))
	(* 2 appr))
     3))

(define (cube x)
  (* x x x))

(define (cube-enough? guess x)
  (< (abs (- (cube guess) x))
     (* (abs guess) 0.01)))

(define (cube-iter appr x)
  (if (cube-enough? appr x)
      appr
      (cube-iter (do-cube appr x)
		 x)))

(define (cbfn x)
  (cube-iter 1.0 x))

(cbfn -27)
(cbfn 8)
