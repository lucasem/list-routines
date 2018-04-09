#lang racket/base
(provide params input output description deps example-params evaluate generate)

(require racket/list)
(require "../prelude.rkt")

(define input '(int-list (length-at-least 1)))
(define output '(int))
(define params '())

(define description "multiplies all elements of the list.")
(define deps '())

(define example-params '(()))

(define (evaluate l params) (foldl * 1 l))

(define generate (generate-many
  #:len-valid (λ (len _) (positive? len))
  #:len-default (λ _ (random 1 8))))