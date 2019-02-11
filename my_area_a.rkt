#lang racket
(define pi 3.14169)
(define (my_area x r)
(cond
  ((< r 0) #f)
  ((equal? x 1) (* pi r r))
  ((equal? x 2) (* (/ 4 3) pi r r r) )
  (else #f)))

(my_area 1 10)
(my_area 2 10)
(my_area 3 10)
(my_area 1 -10)
(my_area 0 -10)
