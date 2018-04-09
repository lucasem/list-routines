#lang racket/base
(provide params input output description deps example-params evaluate generate)

(require math/number-theory)
(require "../prelude.rkt")

(define input '(positive))
(define output '(positive))
(define params '())

(define description "returns the `n`-th prime number, where `n` is the given number. The first prime number is 2.")
(define deps '())

(define example-params '(()))

(define (evaluate i params) (nth-prime (sub1 i)))

(define generate (generate-many
  (λ _ (random 1 15))))