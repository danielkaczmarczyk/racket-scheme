; rocket - a racket testing framework
#lang racket

(provide rocket-test)

(define (rocket-test fn input expected)
  (define result (fn input))

  (if
    (eq?
      result
      expected)
    (displayln "PASS")
    (displayln "FAIL")))


;(define (rocket-suite))

