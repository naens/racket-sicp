(define (eqlist a b)
  (cond ((null? a) (null? b))
	((and (pair? a) (pair? b)) (and (eqlist (car a) (car b))
					(eqlist (cdr a) (cdr b))))
	(#t (eq? a b))))


(eqlist '() '())
;; #t

(eqlist '() '(a))
;; #f

(eqlist '(a) '())
;; #f

(eqlist '(a () b) '(a () b))
;; t

(eqlist '(a (a b c) e d c) '(a (a b c) e d c))
;; #t

(eqlist '(a (a b c) e d c) '(a a (b c) e d c))
;; #f
