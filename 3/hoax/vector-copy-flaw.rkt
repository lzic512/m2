#lang racket
;; The vector copy you guys made does not check for a valid range
(let ((x (make-vector 3 42))) (vector-copy* x 15))
