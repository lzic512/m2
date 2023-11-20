#lang racket
(define (f x) (+ x 0))
(define (g y) (let ((z (f 87))) (- z 74)))
(g 5)
