open Common
open Reprocessing

type state = {control: Control.state, buttons: array<Button.state>, notes: array<Note.state>}

let foi = float_of_int

let setup = env => {
  Env.size(~width, ~height, env)

  {
    control: Control.init,
    buttons: Button.init,
    notes: Note.init,
  }
}

let isPressed = ({Button.color: color}, state) => {
  (color === Green && Control.isGreen(state.control)) ||
  color === Red && Control.isRed(state.control) ||
  color === Yellow && Control.isYellow(state.control) ||
  color === Blue && Control.isBlue(state.control) ||
  (color === Orange && Control.isOrange(state.control))
}

let draw = (state, env) => {
  Draw.background(Constants.black, env)

  Array.iter(({Button.x: x, y, w, h, color} as button) => {
    let isPressed = isPressed(button, state)
    Button.draw(~x, ~y, ~w, ~h, ~color, ~isPressed, env)
  }, state.buttons)

  Array.iter(({Note.x: x, y, w, h, color}) => {
    Note.draw(~x, ~y, ~w, ~h, ~color, env)
  }, state.notes)

  let hit = ref(false)

  Array.iter(({Button.x: bx, y: by, w: bw, h: bh} as button) => {
    let isPressed = isPressed(button, state)

    Array.iter(({Note.x: nx, y: ny, w: nw, h: nh}) => {
      if (
        isPressed &&
        Utils.intersectRectRect(
          ~rect1H=foi(bh),
          ~rect1W=foi(bw),
          ~rect1Pos=(foi(bx), foi(by)),
          ~rect2H=foi(nh),
          ~rect2W=foi(nw),
          ~rect2Pos=(foi(nx), foi(ny)),
        )
      ) {
        hit := true
      }
    }, state.notes)
  }, state.buttons)

  {
    ...state,
    notes: Array.map(({Note.x: x, y, w, h, color}) => {
      {
        Note.x: x,
        y: y + h < height ? y + 5 : Note.defaultY,
        w: w,
        h: h,
        color: color,
      }
    }, state.notes),
  }
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
