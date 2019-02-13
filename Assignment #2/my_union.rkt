#lang racket
(define (membership atm a_list)
  (cond
       ((null? a_list) #f)
       ((eq? atm (car a_list)) #t)
       (else (membership atm (cdr a_list)))
 ))

(define (my_union a_list b_list)
  (cond
    ((null? a_list)b_list)
     ((membership (car a_list) b_list)
     (my_union (cdr a_list) b_list))
  (else (cons (car a_list) (my_union(cdr a_list) b_list) )))
  )

(my_union '(a b c t m e) '(n m k f))
(my_union '() '(a b c))
(my_union '(a b) '())
(my_union '(a b c) '(a d f))
(my_union '(e b c d) '(a b c))