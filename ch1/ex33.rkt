(define (filtered-accumulate combiner null-value term a next b filter)
  (define (rec n acc)
    (cond ((= n b) acc)
          ((filter n) (rec (next n) (combiner acc (term n))))
          (#t (rec (next n) acc))))
  (rec a null-value))

(define (identity x) x)
(define (inc a) (+ a 1))
(define (even-p n) (= (modulo n 2) 0))
(define (evsum a b)
  (filtered-accumulate + 0 identity a inc b even-p))

(evsum 0 10)

(define (prime? x)
  (define (rec n acc)
    (if (> (* n n) x)
        acc
        (rec (+ n 1) (and (not (= (modulo x n) 0))
                          acc))))
  (rec 2 #t))

(prime? 11)
(prime? -1)

;; sum of the squares of primes
(define (ssp a b)
  (filtered-accumulate + 0 (lambda (x) (* x x)) a inc b prime?))

(ssp 0 10)


(define (gcd a b)
  (define (rec n m acc)
    (if (> n m)
        acc
        (rec (+ n 1) m (if (and (= (modulo a n) 0)
                                (= (modulo b n) 0)
                                (> n acc))
                           n
                           acc))))
  (rec 2 (if (> a b) b a) 1))

(gcd 10 15)

;; all positive numbers < n that GCD(<number>, n) is 1
(define (rp n)
  (filtered-accumulate * 1 identity 1 inc n (lambda (x) (= (gcd x n) 1))))

(rp 10)

;; 1 YES
;; 2 NO
;; 3 YES
;; 4 NO
;; 5 NO
;; 6 NO
;; 7 YES
;; 8 NO
;; 9 YES
(* 1 3 7 9)
