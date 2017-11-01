#![feature(plugin,custom_derive,decl_macro)]
#![plugin(rocket_codegen)]

extern crate itertools;
extern crate rocket;
extern crate serde;
#[macro_use]
extern crate serde_derive;
#[macro_use]
extern crate serde_json;

pub mod api;
pub mod graph;
pub mod routine;