#lang racket

(require 2htdp/image)
(require 2htdp/universe)

(define (number->square s)
  (square s "solid" "red"))

(define small (number->square 5))
(define medium (number->square 10))
(define large (number->square 15))

(define images (list small medium large))
(define filenames (list "small" "medium" "large"))
(define filenames-full (map (lambda (filename) (string-append filename ".png")) filenames))

(define (save-images)
  (for-each save-image images filenames-full))

(save-images)

(big-bang 100 [to-draw number->square])
