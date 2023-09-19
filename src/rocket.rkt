; rocket - a racket testing framework
#lang racket

(require "./utils.rkt")

(require ansi-color)
(background-color 'black)
(foreground-color 'green)

(provide rocket-test print-tests-header)

; TODO return the string from color-display instead of the function evaluation
; cause it seems to be printing #<void>. I need the value not side effect
; seems like it's working just luckily
(define (colorize-status status)
  (if
    (string=? status "PASS")
    (color-display status)
    (parameterize ([foreground-color 'red])
                 (color-display status))))

(define (print-tests-header)
  (print-message "TESTS" "-"))

(define (stringify atom)
  (cond
    [(number? atom) (number->string atom)]
    [else atom]))

(define (generate-test-message status fn-name inputs result expected)
  (format "~a: function `~a` with inputs ~a produced ~a, expected ~a"
          (colorize-status status) fn-name inputs result expected))

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
      (apply fn inputs)))
  (define result-vs-expected (compare-things result expected))

  (if result-vs-expected
      (displayln (generate-test-message "PASS" fn-name inputs result expected))
      (displayln (generate-test-message "FAIL" fn-name inputs result expected))))

