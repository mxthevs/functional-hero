open Common
open Reprocessing

type state = {
  control: Control.state,
  buttons: array<Button.state>,
  notes: array<Note.state>,
  score: Score.state,
}

let foi = float_of_int
let deref = x => x.contents

let setup = env => {
  Env.size(~width, ~height, env)

  {
    control: Control.init,
    buttons: Button.init,
    notes: Note.init,
    score: Score.init,
  }
}

let isPressed = ({Button.color: color}, control) => {
  (color === Green && Control.isGreen(control)) ||
  color === Red && Control.isRed(control) ||
  color === Yellow && Control.isYellow(control) ||
  color === Blue && Control.isBlue(control) ||
  (color === Orange && Control.isOrange(control))
}

let draw = ({control, buttons, notes, score} as state, env) => {
  Draw.background(Constants.white, env)

  Draw.text(~body=score.total->Int.toString, ~pos=(5, 5), env)

  buttons->Array.forEach(({Button.x: x, y, w, h, color} as button) => {
    let isPressed = isPressed(button, control)
    Button.draw(~x, ~y, ~w, ~h, ~color, ~isPressed, env)
  })

  notes->Array.forEach(({x, y, w, h, color}) => {
    Note.draw(~x, ~y, ~w, ~h, ~color, env)
  })

  let notes = notes->Array.map(({x, y, w, h, hit, status} as note) => {
    if hit || status === Touched {
      note
    } else {
      let hit = ref(false)
      let status = ref(Note.Untouched)

      buttons->Array.forEach(({Button.x: bx, y: by, w: bw, h: bh} as button) => {
        if (
          isPressed(button, control) &&
          Utils.intersectRectRect(
            ~rect1H=foi(h),
            ~rect1W=foi(w),
            ~rect1Pos=(foi(x), foi(y)),
            ~rect2H=foi(bh),
            ~rect2W=foi(bw),
            ~rect2Pos=(foi(bx), foi(by)),
          )
        ) {
          hit := true
          status := Touched
        }
      })

      {
        ...note,
        hit: deref(hit),
        status: deref(status),
      }
    }
  })

  {
    ...state,
    score: {
      ...score,
      total: score.total + notes->Array.keep(({hit}) => hit)->Array.length * score.multiplier,
    },
    notes: notes
    ->Array.map(({y, h} as note) => {
      {
        ...note,
        y: y + h < height ? y + 5 : Note.defaultY,
      }
    })
    ->Array.keep(({status}) => status !== Touched),
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
