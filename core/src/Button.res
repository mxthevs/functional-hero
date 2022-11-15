type state = {
  x: int,
  y: int,
  w: int,
  h: int,
  isPressed: bool,
  color: Color.t,
}

let init = [
  {x: 110, y: Common.subHeight(110), w: 100, h: 100, isPressed: false, color: Green},
  {x: 220, y: Common.subHeight(110), w: 100, h: 100, isPressed: false, color: Red},
  {x: 330, y: Common.subHeight(110), w: 100, h: 100, isPressed: false, color: Yellow},
  {x: 440, y: Common.subHeight(110), w: 100, h: 100, isPressed: false, color: Blue},
  {x: 550, y: Common.subHeight(110), w: 100, h: 100, isPressed: false, color: Orange},
]

let draw = (~x, ~y, ~w, ~h, ~color, ~isPressed, env) => {
  open Reprocessing

  let {r, g, b, a} = Color.toRgba(color)

  Draw.fill(isPressed ? {r: 0., g: 0., b: 0., a: 0.} : {r: r, g: g, b: b, a: a}, env)
  Draw.rect(~pos=(x, y), ~width=w, ~height=h, env)
}
