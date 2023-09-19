; rocket - a racket testing framework
#lang racket

(provide rocket-test)

(define (stringify atom)
  (cond 
    [(number? atom) (number->string atom)]
    [else atom]))

(define (generate-test-message 
          prefix
          fn_name
          input
          output
          expected)

  (string-append 
    (string-append
      prefix ": " fn_name " called with: " (stringify input) " produced: `" (stringify output)) "`"
    (if (eq? prefix "FAIL")
      (string-append " expected: `" (stringify expected) "`")
      "")))

; assumes type of a and b are the same
; TODO update to handle a situation when this isn't true
(define (compare-things a b)
  (cond
    [(string? a) (string=? a b)]
    [(number? a) (= a b)]))

(define (rocket-test fn fn-name input expected [should-fail #f])
  (define result (fn input))
  (define result-vs-expected (compare-things result expected))
  (define result-accounted-for-failure
    (if should-fail
      (eq? #t (eq? result-vs-expected #f))
      result-vs-expected))

  (if
    result-accounted-for-failure
    (displayln (generate-test-message "PASS" fn-name input result expected))
    (displayln (generate-test-message "FAIL" fn-name input result expected))))


;(define (rocket-suite))

