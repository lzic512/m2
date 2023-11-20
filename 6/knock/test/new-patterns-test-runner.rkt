#lang racket
;; NOTE: New file.
(provide test/new-patterns test/io/new-patterns)
(require rackunit)

(define (test/new-patterns run)
  (begin ;; Testing the ? pattern.
    (check-equal? (run '(define (two? x) (eq? x 2))
                       '(match 2
                          [(? two? x) x]
                          [_ #f]))
                  2)
    (check-equal? (run '(define (two? x) (eq? x 2))
                       '(match 3
                          [(? two? x) x]
                          [_ #f]))
                  #f)
    ;; TODO: Add non-I/O tests of ? here, if you like.
    ;(check-equal? (run '(define (one? x)
;			   (eq? x 1))
;		       '(define (two? x)
;			   (eq? x 2))
;		       '(match 2
;			        [(? one? x) (sub1 x)]
;				  [(? two? x) (add1 x)]
;				    [_ #f])) 
;		  3)

    )
  (begin ;; Testing the app pattern.
    (check-equal? (run '(define (cons-with-7 x) (cons x 7))
                       '(match #t
                          [(app cons-with-7 p) (cdr p)]
                          [_ #f]))
                  7)
    (check-equal? (run '(define (cons-with-7 x) (cons x 7))
                       '(match #t
                          [(app cons-with-7 p) (car p)]
                          [_ #f]))
                  #t)
    ;; TODO: Add non-I/O tests of app here, if you like.
    (check-equal? (run
		            '(define (head-in-box x)
			                    (match x
						                      [(cons x _) (box x)]
								                     [_ 0]))
			             '(match (cons 1 2)
					                  [(app head-in-box (box z)) z]
							             [(app head-in-box z) (zero? z)])) 1)
        
    ))

(define (test/io/new-patterns run)
  (begin ;; Testing the ? pattern.
    (check-equal? (run "c"
                       '(define (two? x) (eq? x 2))
                       '(match (- (read-byte) 97)
                          [(? two? x) x]
                          [_ #f]))
                  (cons 2 ""))
    ;; TODO: Add I/O tests of ? here, if you like.
    )
  (begin ;; Testing the app pattern.
    (check-equal? (run "a"
                       '(define (cons-with-7 x) (cons x 7))
                       '(match (read-byte)
                          [(app cons-with-7 p) (integer->char (car p))]
                          [_ #f]))
                  (cons #\a ""))
    ;; TODO: Add I/O tests of app here, if you like.

    ))
