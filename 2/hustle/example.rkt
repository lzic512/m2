#lang racket
(let ((x (box 8))) (let ((y (set-box! x 9))) (unbox x))) 
