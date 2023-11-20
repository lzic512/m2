#lang racket
;; NOTE: New file.
(provide test/faulty-let test/io/faulty-let)
(require rackunit)

(define (test/faulty-let run)
  (begin ;; Testing the faulty let.
    (check-equal? (run '(add1 0))
                  1)))

(define (test/io/faulty-let run)
  (begin ;; Testing the faulty let.
    (check-equal? (run "a"
                       '(read-byte))
                  (cons 97 ""))))
