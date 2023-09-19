#lang racket

;import testing framework
(require "./rocket.rkt")

;ex 12
(require "./ex12-20.rkt")

(rocket-test cvolume "cvolume" 3 27)
(rocket-test csurface "csurface" 3 18)
(rocket-test csurface "csurface" 3 19)
