#lang racket

(require 2htdp/batch-io)

(define filename "./tmp/sample.dat")

(write-file filename "212\n")

(read-file filename)

(define file-contents (read-file filename))

(write-file 'stdout file-contents)

(define input (read-file 'stdin))

(displayln input)
