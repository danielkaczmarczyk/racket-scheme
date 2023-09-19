; rocket - a racket testing framework
#lang racket

(provide rocket-test)

(define (stringify atom)
  (cond
    [(number? atom) (number->string atom)]
    [else atom]))

(define (generate-test-message status fn-name inputs result expected)
  (format "~a: function `~a` with inputs ~a produced ~a, expected ~a"
          status fn-name inputs result expected))

; assumes type of a and b are the same
; TODO update to handle a situation when this isn't true
(define (compare-things a b)
  (cond
    [(string? a) (string=? a b)]
    [(number? a) (= a b)]))

; main test function
(define (rocket-test fn fn-name inputs expected)
  (define result 
    (if (= 1 (length inputs))
      (fn (car inputs))
      (fn (apply inputs))))
  (define result-vs-expected (compare-things result expected))

  (if result-vs-expected
      (displayln (generate-test-message "PASS" fn-name inputs result expected))
      (displayln (generate-test-message "FAIL" fn-name inputs result expected))))

