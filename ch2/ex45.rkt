#lang racket
(#%require sicp-pict)

(define (split arg1 arg2)
  (lambda (painter n)
    (cond ((= n 0) painter)
          (#t (let ((smaller ((split arg1 arg2) (- n 1))))
                (arg1 painter (arg2 smaller smaller)))))))


