#lang sicp

; n
(define (expt b n)
  (if (= 0 n) 1
      (* b (expt b (- n 1)))))

; n
(define (expt-iter b n product)
  (if (= n 0)
      product
      (expt-iter b (- n 1) (* b product))))

;log(n)
(define (fast-expt b n)
  (cond ((= n 1) b)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (square x) (* x x))
(define (even? x) (= (remainder x 2) 0))

(define (fast-expt-iter a b n)
  (cond ((= n 0) a)
        ((even? n) (fast-expt-iter a (square b) (/ n 2)))
        (else (fast-expt-iter (* a b) b (- n 1)))))


; (fast-expt-iter 1 2 3)

(define (* a b)
  (if (= b 0)
      0
      (+ a (* a (- b 1)))))

(define (double x) (+ x x))
(define (halve x) (/ x 2))

(define (fast-mul a b)
  (cond ((= b 1) a)
        ((even? b) (double (fast-mul a (halve b))))
        (else (+ a (fast-mul a (- b 1))))))

; (fast-mul 4 5)

(define (fast-mul-iter n a b)
  (cond ((= b 0) n)
        ((even? b) (fast-mul-iter n (double a) (halve b)))
        (else (fast-mul-iter (+ n a) a (- b 1)))))

(fast-mul-iter 0 4 5)
















                   
        