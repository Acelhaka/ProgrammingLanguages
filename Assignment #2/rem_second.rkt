#lang racket
(define (rem_second a_list)
 (cond
  ((null? a_list) null)
  ((null? (cdr a_list)) null)
  
     (else(cons (car a_list) (cddr a_list)))))

(rem_second '(a (b c) d (e f) g))
(rem_second '(a b c))
(rem_second '(a b))
(rem_second '(a))
(rem_second '())
(rem_second '(()))
