#lang racket

;import testing framework
(require "./rocket.rkt")

;ex 12-20
(require "./ex12-20.rkt")


(displayln " ------------------------------------------ TESTS --------------------------------------")

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
