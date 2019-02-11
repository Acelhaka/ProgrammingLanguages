#lang racket
(define pi 3.1416)
(define (my_area x r)
(if (< r 0)
    #f
  (if (equal? x 1)
       (* pi r r)
    (if (equal? x 2)
        (* (/ 4 3) pi r r r) 
  #f))))

(my_area 1 10)
(my_area 2 10)
(my_area 3 10)
(my_area 1 -10)
(my_area 0 -10)

      
