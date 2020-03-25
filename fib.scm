#lang sicp

(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1)) (fib (- n 2))))))

(define (fib-iter a b n)
  (if (= n 0)
      b
     (fib-iter (+ a b) a (- n 1))))


; (fib-iter 1 0 7)

(define (fib2 n)
  (fib-iter2 1 0 0 1 n))
(define (fib-iter2 a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter2 a
                   b
                   (+ (square p) (square q))
                   (+ (* 2 p q) (square q))
                   (/ count 2)))
        (else (fib-iter2 (+ (* b q) (* a q) (* a p))
                         (+ (* b p) (* a q))
                         p
                         q
                         (- count 1)))))

(define (square p) (* p p))

(fib2 7)


