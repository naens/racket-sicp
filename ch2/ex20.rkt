(define (true-for-all p l)
  (cond ((null? l) #t)
        (#t (and (p (car l)) (true-for-all p (cdr l))))))

(define (dabda e . l)
  (true-for-all (lambda (x) (= (modulo x 2) (modulo e 2)))
                l))


(dabda 1 3 5)
;; #t

(dabda 2 4 8)
;; #t

(dabda 1 2 3)

(define (filt p l)
  (cond ((null? l) '())
        ((p (car l)) (cons (car l) (filter p (cdr l))))
        (#t (filter p (cdr l)))))

(define (same-parity e . l)
  (cons e (filt (lambda (x) (= (modulo x 2) (modulo e 2)))
                l)))

(same-parity 1 2 3 4 5 6 7)
;; (1 3 5 7)

(same-parity 2 3 4 5 6 7)
;; (2 4 6)
