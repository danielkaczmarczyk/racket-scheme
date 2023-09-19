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
      prefix ": " fn_name " called with: " (stringify input) " produced: " (stringify output))
    (if (eq? prefix "FAIL")
      (string-append " expected: " (stringify expected))
      "")))

(define (rocket-test fn fn_name input expected)
  (define result (fn input))

  (if
    (eq?
      result
      expected)
    (displayln (generate-test-message "PASS" fn_name input result expected))
    (displayln (generate-test-message "FAIL" fn_name input result expected))))


;(define (rocket-suite))

