;; S=5
;; {1,2,3}

;; 1+1+1+1+1
;; 2+1+1+1
;; 2+2+1
;; 3+1+1
;; 3+2

(define (count-change amount)
  (cc amount 3))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
	((= kinds-of-coins 2) 2)
	(#t 3)))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
	((or (< amount 0) (= kinds-of-coins 0)) 0)
	(#t (+ (cc amount
		   (- kinds-of-coins 1))
	       (cc (- amount
		      (first-denomination kinds-of-coins))
		   kinds-of-coins)))))

(count-change 5)
;; 5

(define (change a l)
  (cond ((= a 0) 1)
	((< a 0) 0)
	((empty? l) 0)
	(#t (+ (change a (rest l))
	       (change (- a (first l)) l)))))

(change 5 '(1 2 3))
;; 5

(change 100 '(50 25 10 5 1))
;; 292
