### @routine (parametric)

`@routine` @description

Examples:
@in[e examples]{
- @(first e)
  @in[ex (second e)]{
    - @(first ex) => @(second ex)

  }
}

@conceptual-dependencies
@in[d deps]{
- [@d](#@if[(routine-is-parametric d)
            (string-append d "-parametric")
            d])

}