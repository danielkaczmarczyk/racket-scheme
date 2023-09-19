#lang racket

(require 2htdp/image)
(require 2htdp/universe)

(define (ari-tests)
  (- 2 1)
  ; the above is equal to 2 minus 1
  ; 2 - 1 = 1
  (- 1 2)
  ; the above is equal to -1
  ; 1 - 2 = -1

  ; so
  (- 2 1 1)
  ; the above should equal
  ; (2 - 1) - 1 = 0

  ; and
  (- 1 2 2)
  ; should be
  ; (1 - 2) - 2 = -3

  ; and
  (- 2 1 1 1)
  ; would be now - 1

  ; and
  (- 1 2 2 5) 
  ; would be -8

  ; and
  (- 5 1 1 1 1 1)
  ; zero
)

(define (output-tests)
  "hello world"

  (string-append "hello " "world")
  (string->number "42")
  (number->string 42)
  (eq? (+ (string-length "abc") 3) 6)
  (string->number "hello")

  ; syntax idea for an if
  ; (if #t #t 3 else 5)

  (string-append "line break!" "")
  ( < 3 10 11)
  (eq? (>= 10 10) #t)
  (string=? "design" "tinker")

  (if (eq? 10 10)
      "equals!"
      "pequals")
)

(define (image-functions)
  (define my-circle (circle 50 "solid" "blue"))
  (save-image my-circle "my-circle.bmp")
  (define my-image (overlay my-circle (empty-scene 200 200)))
  (eq? 
    (save-image my-image "my-image.bmp")
    #t
  )
  (define red-bottom (rectangle 200 100 "solid" "red"))
  (define polish-flag (place-image red-bottom 100 150 (empty-scene 200 200)))
  (save-image polish-flag "polish-flag.bmp")


  (define (flying-sphere height)
    (place-image my-circle 50 (modulo height 100) (empty-scene 100 60)))
  (define (run-flying-sphere-animation) (animate flying-sphere))

  ""
)


(define (greater-than-zero x) (> x 0))
(define (is-zero x) (= x 0))
(define (less-than-zero x) (< x 0))

(define (sign x)
  (cond 
    [(greater-than-zero x) 1]
    [(is-zero x) 0]
    [(less-than-zero x) -1]
  )
)

; primitve testing framework
(define sign-tests
  (if
    (and
      (eq? (sign 3) 1)
      (eq? (sign 0) 0)
      (eq? (sign -11) -1)
    )
    "all tests passed for module sign"
    "some tests failed for module sign"
  ))
; I love this paradigm of programming!


; section 1: fixed-size data
(define (exercise-1)
  (define x 3)
  (define y 4)

  (define (distance-to-origin x y)
    (sqrt (+ (sqr x) (sqr y))))

  (distance-to-origin x y)
)

(define (add-test-subject-string prefix subject)
  (string-append prefix " with " subject))

(define exercise-name "exercise-1")

(define (test-exercise-1)
  (if (eq? (exercise-1) 5)
    (add-test-subject-string "all good" exercise-name)
    (add-test-subject-string "something isn't right" exercise-name)))

(define prefix "hello")
(define suffix "world")

(define (make-hw)
  (string-append prefix "_" suffix))

(define str "helloworld")
(define i 5)

(define (make-hw-2)

  (string-append
    (substring str 0 i)
    "_"
    (substring str i (string-length str))
  )
)

(define (remove-ith i str)
  (string-append
    (substring str 0 i)
    (substring str (+ i 1))))

;(remove-ith i (make-hw-2))

(define sunny #true)
(define friday #false)

(define (ex-7)
  ;whether sunny is false or friday is true
  (or
    (eq? sunny #false)
    (eq? friday #true)))

(define (ex-9)
  ; in converts a value of in to a non-negative integer
  ; for a string it returns its length
  ; for a number returns absolute value
  ; for #true it uses 10
  ; for #false it uses 20
  ; for image it uses its area
  (define (in x)
    (cond 
      [(eq? x #t) 10]
      [(eq? x #false) 20]
      [(integer? x) x]
      [(string? x) (string-length x)]))


  (define (bool->str bool)
    (if
      bool
      "true"
      "false"))

  (define (stringify thing)
    (cond
      [(boolean? thing) (bool->str thing)]
      [(integer? thing) (number->string thing)]
      [else thing]))  

  (define (build-failure-message fn output expected argument_passed)
            (string-append
              "FAILURE: function `"
              fn
              "` produced "
              (stringify output)
              " expected: "
              (stringify expected)
              " when passed "
              (stringify argument_passed)))

  (define (test function argument_passed expected_result)
    (define result
      (function argument_passed))

    (if
      (eq? 
        result
        expected_result
      )
      (displayln "PASS")
      (displayln (build-failure-message
                   "in"
                   result
                   expected_result
                   argument_passed))))

  (define (suite)
    (begin
      (test in #t 10)
      (test in #f 20)
      (test in "abc" 3)
      (test in "daniel" 6)
      (test in 6 6)
      ))

  (suite)
)

(ex-9)
