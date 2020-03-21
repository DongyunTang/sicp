#lang sicp

(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1)) (fib (- n 2))))))

(define (fib-iter a b n)
  (if (= n 1)
      b
     (fib-iter b (+ a b) (- n 1))))

(define (fib2 n)
  (fib-iter 0 1 n))

(fib2 100)

