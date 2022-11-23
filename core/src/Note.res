type state = {
  x: int,
  y: int,
  w: int,
  h: int,
  color: Color.t,
  hit: bool,
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
    hit: false,
  },
  {
    x: Common.width / 2 - size / 2 - padd,
    y: defaultY - size * 2,
    w: size,
    h: size,
    color: Red,
    hit: false,
  },
  {
    x: Common.width / 2 - size / 2,
    y: defaultY - size * 4,
    w: size,
    h: size,
    color: Yellow,
    hit: false,
  },
  {
    x: Common.width / 2 - size / 2 + padd,
    y: defaultY - size * 5,
    w: size,
    h: size,
    color: Blue,
    hit: false,
  },
  {
    x: Common.width / 2 - size / 2 + padd * 2,
    y: defaultY - size * 7,
    w: size,
    h: size,
    color: Orange,
    hit: false,
  },
  {
    x: Common.width / 2 - size / 2 - padd * 2,
    y: defaultY - 300,
    w: size,
    h: size,
    color: Green,
    hit: false,
  },
  {
    x: Common.width / 2 - size / 2 - padd,
    y: defaultY - 300 * 2,
    w: size,
    h: size,
    color: Red,
    hit: false,
  },
  {
    x: Common.width / 2 - size / 2,
    y: defaultY - 300 * 4,
    w: size,
    h: size,
    color: Yellow,
    hit: false,
  },
  {
    x: Common.width / 2 - size / 2 + padd,
    y: defaultY - 300 * 5,
    w: size,
    h: size,
    color: Blue,
    hit: false,
  },
  {
    x: Common.width / 2 - size / 2 + padd * 2,
    y: defaultY - 300 * 7,
    w: size,
    h: size,
    color: Orange,
    hit: false,
  },
]

let draw = (~x, ~y, ~w, ~h, ~color, env) => {
  open Reprocessing

  let {r, g, b, a} = Color.toRgba(color)

  Draw.fill(Utils.color(~r, ~g, ~b, ~a), env)
  Draw.rect(~pos=(x, y), ~width=w, ~height=h, env)
}
