#lang sicp

(load "book_1-2-6.rkt")

(define (search-for-primes from to)
  (cond ((= (remainder from 2) 0) (search-for-primes (+ from 1) to))
        ((<= from to)
         (timed-prime-test2 from)
         (search-for-primes (+ from 2) to))))

(search-for-primes 1000 1100)
;; 1 (2)
;; 1 (2)
;; 1 (2)

(search-for-primes 10000 10100)
;; 3 (5)
;; 4 (6)
;; 4 (6)

(search-for-primes 100000 100100)
;; 11 (18)
;; 12 (17)
;; 10 (17)

(search-for-primes 1000000 1000100)
;; 33 (56)
;; 35 (55)
;; 33 (56)

(search-for-primes 10000000 10001000)
;; 107 (214)
;; 105 (176)
;; 104 (178)

(search-for-primes 100000000 100000100)
;; 338 (552)
;; 335 (552)
;; 368 (594)

(search-for-primes 1000000000 1000000100)
;; 1150 (1793)
;; 1058 (1768)
;; 1048 (1757)

(search-for-primes 10000000000 10000000100)
;; 3340 (5480)
;; 3389 (5524)
;; 3342 (5516)
