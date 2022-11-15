type state = {
  x: int,
  y: int,
  w: int,
  h: int,
  color: Color.t,
}

%%private(let size = 50)
%%private(let yPos = size + 10)
%%private(let padd = size + 60)

let init = [
  {
    x: Common.width / 2 - size / 2 - padd * 2 /* 110 */,
    y: Common.subHeight(yPos),
    w: size,
    h: size,
    color: Green,
  },
  {
    x: Common.width / 2 - size / 2 - padd /* 220 */,
    y: Common.subHeight(yPos),
    w: size,
    h: size,
    color: Red,
  },
  {
    x: Common.width / 2 - size / 2 /* 330 */,
    y: Common.subHeight(yPos),
    w: size,
    h: size,
    color: Yellow,
  },
  {
    x: Common.width / 2 - size / 2 + padd /* 440 */,
    y: Common.subHeight(yPos),
    w: size,
    h: size,
    color: Blue,
  },
  {
    x: Common.width / 2 - size / 2 + padd * 2 /* 550 */,
    y: Common.subHeight(yPos),
    w: size,
    h: size,
    color: Orange,
  },
]

let draw = (~x, ~y, ~w, ~h, ~color, ~isPressed, env) => {
  open Reprocessing

  let {r, g, b, a} = Color.toRgba(color)
  let color = isPressed ? Constants.black : Utils.color(~r, ~g, ~b, ~a)

  Draw.fill(color, env)
  Draw.rect(~pos=(x, y), ~width=w, ~height=h, env)
}
