#lang sicp

(load "book_1-2-6.rkt")

;;using random2
(define (search-for-primes from to)
  (cond ((= (remainder from 2) 0) (search-for-primes (+ from 1) to))
        ((<= from to)
         (timed-prime-test3 from)
         (search-for-primes (+ from 2) to))))

(search-for-primes 1000 1100)
;; 5 (1 (2))
;; 5 (1 (2))
;; 4 (1 (2))

(search-for-primes 10000 10100)
;; 6 (3 (5))
;; 7 (4 (6))
;; 6 (4 (6))

(search-for-primes 100000 100100)
;; 8 (11 (18))
;; 7 (12 (17))
;; 7 (10 (17))

(search-for-primes 1000000 1000100)
;; 9 (33 (56))
;; 8 (35 (55))
;; 7 (33 (56))

(search-for-primes 10000000 10001000)
;; 9 (107 (214))
;; 9 (105 (176))
;; 9 (104 (178))

(search-for-primes 100000000 100000100)
;; 11 (338 (552))
;; 10 (335 (552))
;; 11 (368 (594))

(search-for-primes 1000000000 1000000100)
;; 12 (1150 (1793))
;; 14 (1058 (1768))
;; 13 (1048 (1757))

(search-for-primes 10000000000 10000000100)
;; 67 (3340 (5480))
;; 64 (3389 (5524))
;; 63 (3342 (5516))
