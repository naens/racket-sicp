#lang sicp

(load "book_1-3.rkt")

(fixed-point (lambda(x) (+ 1 (/ 1 x))) 1.0)
(fixed-point2 (lambda (x) (/ (log 1000) (log x))) 1.1) ;37 steps
(fixed-point2 (lambda (x) (/ (+ (/ (log 1000) (log x)) x) 2)) 1.1) ;13 steps
