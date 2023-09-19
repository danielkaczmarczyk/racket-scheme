#lang racket

(require "./rocket.rkt") ; testing framework
(require "./utils.rkt") ; various utilities
(require "./images.rkt") ; for make-image

;ex 12-20
(require "./ex12-20.rkt")

(clear-screen)
(print-tests-header)

(rocket-test cvolume "cvolume" (list 3) 27)
(rocket-test csurface "csurface" (list 3) 18)
(rocket-test string-first "string-first" (list "daniel") "d")
(rocket-test string-last "string-last" (list "daniel") "l")

; TODO there's something wrong with testing this function, it always passes no matter the comparsion
; parameters. needs review
(rocket-test ==> "==>" (list #false #true) #true)
(rocket-test ==> "==>" (list #false #false) #true)
(rocket-test ==> "==>" (list #true #true) #true)
(rocket-test ==> "==>" (list #false #true) #true)
(rocket-test ==> "==>" (list #true #false) #false)

(rocket-test image-area "image-area" (list make-img) 100)

(print-tests-footer)
