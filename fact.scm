#lang sicp

(define (factorial n)
  (if (> n 1)
      (* n (factorial (- n 1)))
      1))

(define (fact-iter n curr index)
  (if (> index n)
      curr
      (fact-iter n (* curr index) (+ 1 index))))

(define (fact2 n)
  (fact-iter n 1 1))

(fact2 5)
