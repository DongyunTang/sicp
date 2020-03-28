#lang sicp

(define (cube x) (* x x x))

(define (sum-integers a b)
  (if (> a b)
      0
      (+ a (sum-integers (+ a 1) b))))

(define (sum-cubes a b)
  (if (> a b)
      0
      (+ (cube a)
         (sum-cubes (+ a 1) b))))

(define (pi-sum a b)
  (if (> a b)
      0
      (+ (/ 1.0 (* a (+ a 2)))
         (pi-sum (+ a 4) b))))

; high-order
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (sum2 term a next b)
  (define (iter a result)
    (if (> a b)
        0
        (iter (next a) (+ result (term a)))))
  (iter a 0))

(define (square x) (* x x))
(define (inc x) (+ x 1))

(sum2 square 3 inc 5)

(define (sum-cube2 a b)
  (define (inc x) (+ x 1))
  (sum cube a inc b))

(define (sum-int2 a b)
  (define (identity x) x)
  (define (inc x) (+ x 1))
  (sum identity a inc b))

(define (pi-sum2 a b)
  (define (next y) (+ y 4))
  (define (term x) (/ 1.0 (* x (+ x 2))))
  (sum term a next b))

(define (integral f a b dx)
  (define (next x) (+ x dx))
  (* dx
     (sum f (+ a (/ dx 2.0)) next b)))

(integral cube 0 1 0.001)

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (next x) (+ x 1))
  (define (coeff k)
    (cond ((= k 0) 1)
          ((= k n) 1)
          ((even? k) 2)
          (else 4)))
  (define (y k) (f (+ a (* k h))))
  (define (term k) (* (coeff k) (y k)))
  (*
   (/ h 3)
   (sum term 0 next n)))



(simpson cube 0 1 1000.0)
















          