type state = {
  x: int,
  y: int,
  w: int,
  h: int,
  color: Color.t,
}

%%private(let size = 50)
%%private(let padd = size + 60)

let defaultY = -50

let init = [
  {
    x: Common.width / 2 - size / 2 - padd * 2,
    y: defaultY - size,
    w: size,
    h: size,
    color: Green,
  },
  {
    x: Common.width / 2 - size / 2 - padd,
    y: defaultY - size * 2,
    w: size,
    h: size,
    color: Red,
  },
  {
    x: Common.width / 2 - size / 2,
    y: defaultY - size * 4,
    w: size,
    h: size,
    color: Yellow,
  },
  {
    x: Common.width / 2 - size / 2 + padd,
    y: defaultY - size * 5,
    w: size,
    h: size,
    color: Blue,
  },
  {
    x: Common.width / 2 - size / 2 + padd * 2,
    y: defaultY - size * 7,
    w: size,
    h: size,
    color: Orange,
  },
]

let draw = (~x, ~y, ~w, ~h, ~color, env) => {
  open Reprocessing

  let {r, g, b, a} = Color.toRgba(color)

  Draw.fill(Utils.color(~r, ~g, ~b, ~a), env)
  Draw.rect(~pos=(x, y), ~width=w, ~height=h, env)
}
