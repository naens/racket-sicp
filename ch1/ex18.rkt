;; T: transformation
;;    a1:=bq+aq+ap
;;    b1:=bp+aq
;; T^2: p1:=pp+pq
;;      q1:=2pq+qq
;; dofib a b p q count
;;    if even count
;;       dofib a b (pp+qq) (2pq+qq) (count/2)
;;    else
;;       dofib (bq+aq+ap) (bp+aq) p q (count-1)
;;

(define (dofib a b p q count)
  (cond ((= count 0) a)
        ((even? count)
         (dofib a b (+ (* p p) (* q q)) (+ (* 2 p q) (* q q)) (/ count 2)))
        (#t (dofib (+ (* b q) (* a q) (* a p)) (+ (* b p) (* a q)) p q (- count 1)))))

(define (fibfn n)
  (dofib 1 0 0 1 n))

(fibfn 1)                               ;1
(fibfn 2)                               ;2
(fibfn 3)                               ;3
(fibfn 4)                               ;5
(fibfn 5)                               ;8
(fibfn 6)                               ;13
(fibfn 7)                               ;21
(fibfn 8)                               ;34
(fibfn 123)                             ;36726740705505779255899443
