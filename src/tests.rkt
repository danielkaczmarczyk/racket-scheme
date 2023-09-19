#lang racket

;import testing framework
(require "./rocket.rkt")

;ex 12-20
(require "./ex12-20.rkt")

(rocket-test cvolume "cvolume" (list 3) 27)
(rocket-test csurface "csurface" (list 3) 18)
(rocket-test string-first "string-first" (list "daniel") "d")
(rocket-test string-last "string-last" (list "daniel") "l")
