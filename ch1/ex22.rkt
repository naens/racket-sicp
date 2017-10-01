#lang sicp

(load "book_1-2-6.rkt")

;; Exercise 1.22

(define (search-for-primes from to)
  (cond ((= (remainder from 2) 0) (search-for-primes (+ from 1) to))
        ((<= from to)
         (timed-prime-test from)
         (search-for-primes (+ from 2) to))))

(search-for-primes 1000 1100)
;; 2
;; 2
;; 2

(search-for-primes 10000 10100)
;; 5
;; 6
;; 6

(search-for-primes 100000 100100)
;; 18
;; 17
;; 17

(search-for-primes 1000000 1000100)
;; 56
;; 55
;; 56

(search-for-primes 10000000 10001000)
;; 214
;; 176
;; 178

(search-for-primes 100000000 100000100)
;; 552
;; 552
;; 594

(search-for-primes 1000000000 1000000100)
;; 1793
;; 1768
;; 1757

(search-for-primes 10000000000 10000000100)
;; 5480
;; 5524
;; 5516
