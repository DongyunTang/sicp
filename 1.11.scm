#lang sicp

(define (f1-11 n)
  (if (< n 3)
      n
      (+ (f1-11 (- n 1)) (* 2 (f1-11 (- n 2))) (* 3 (f1-11 (- n 3))))))

(define (f1-11-iter a b c n)
  (if (= n 2)
      c
      (f1-11-iter
       b
       c
       (+ c (* 2 b) (* 3 a))
       (- n 1))))

(f1-11 5)

(f1-11-iter 0 1 2 5)