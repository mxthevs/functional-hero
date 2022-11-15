open Common
open Reprocessing

type state = {control: Control.state, buttons: array<Button.state>}

let setup = env => {
  Env.size(~width, ~height, env)

  {
    control: Control.init,
    buttons: Button.init,
  }
}

let draw = (state, env) => {
  Draw.background(Constants.black, env)

  Array.iter(({Button.x: x, y, w, h, color}) => {
    let isPressed =
      (color === Green && Control.isGreen(state.control)) ||
      color === Red && Control.isRed(state.control) ||
      color === Yellow && Control.isYellow(state.control) ||
      color === Blue && Control.isBlue(state.control) ||
      (color === Orange && Control.isOrange(state.control))

    Button.draw(~x, ~y, ~w, ~h, ~color, ~isPressed, env)
  }, state.buttons)

  state
}

let keyPressed = (state, env) => {
  ...state,
  control: Control.keyDown(Env.keyCode(env), state.control),
}

let keyReleased = (state, env) => {
  ...state,
  control: Control.keyUp(Env.keyCode(env), state.control),
}

run(~setup, ~draw, ~keyPressed, ~keyReleased, ())
