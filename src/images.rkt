#lang racket

(require 2htdp/image)

(provide make-img)

(define (make-rectangle w h)
  (rectangle w h "solid" "blue"))

(define (make-img w h)
  (make-rectangle w h))
