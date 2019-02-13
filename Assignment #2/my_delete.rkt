#lang racket
(define (my_delete atm a_list)
   (cond
     ((null? a_list) a_list)
     ((list? (car a_list))
      (cons (my_delete atm (car a_list)) (my_delete atm(cdr a_list))))
     ((eq? atm (car a_list))
     (my_delete atm (cdr a_list)))
     (else (cons (car a_list) (my_delete atm (cdr a_list))
           ))
     ))

(my_delete 'a '(e a (a d) d))
(my_delete 'b '(a d (b c (d e b (b)) a d)))
(my_delete 'b '((((b))a)d b 2) )
(my_delete 'b '(a (b) (a d b)))