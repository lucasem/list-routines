#lang racket/base
(provide params input output description deps example-params evaluate generate)

(require "../prelude.rkt")
(require math/number-theory)

(define input '(non-negative))
(define output '(non-negative))
(define params '())

(define description "returns the `n`-th Fibonacci number, where `n` is the given number. The first two Fibonacci numbers are both 1. As a special case, the 0-th Fibonacci number is 0, but 0 will never be generated as an input.")
(define deps '())

(define example-params '(()))

(define (evaluate i params) (fibonacci i))

(define generate (generate-many
  (λ _ (random 1 16))))