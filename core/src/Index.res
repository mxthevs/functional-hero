open Common
open Reprocessing

type state = {control: Control.state}

let setup = env => {
  Env.size(~width, ~height, env)

  {
    control: Control.init,
  }
}

let draw = (state, env) => {
  Draw.background(Constants.black, env)
  Draw.fill(Constants.red, env)
  Draw.rect(~pos=(50, 50), ~width=100, ~height=100, env)

  state
}

let keyPressed = (state, env) => {
  control: Control.keyDown(Env.keyCode(env), state.control),
}

let keyReleased = (state, env) => {
  control: Control.keyUp(Env.keyCode(env), state.control),
}

run(~setup, ~draw, ~keyPressed, ~keyReleased, ())
