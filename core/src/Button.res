type state = {
  x: int,
  y: int,
  w: int,
  h: int,
  color: Color.t,
  key: Reprocessing.Events.keycodeT,
}

%%private(let size = 50)
%%private(let yPos = size + 10)
%%private(let padd = size + 60)

let keyToString = code => {
  open Reprocessing_Events
  switch code {
  | A => "A"
  | S => "S"
  | J => "J"
  | K => "K"
  | L => "L"
  | _ => ""
  }
}

let init = [
  {
    x: Common.width / 2 - size / 2 - padd * 2,
    y: Common.subHeight(yPos),
    w: size,
    h: size,
    color: Green,
    key: Reprocessing.Events.A,
  },
  {
    x: Common.width / 2 - size / 2 - padd,
    y: Common.subHeight(yPos),
    w: size,
    h: size,
    color: Red,
    key: Reprocessing.Events.S,
  },
  {
    x: Common.width / 2 - size / 2,
    y: Common.subHeight(yPos),
    w: size,
    h: size,
    color: Yellow,
    key: Reprocessing.Events.J,
  },
  {
    x: Common.width / 2 - size / 2 + padd,
    y: Common.subHeight(yPos),
    w: size,
    h: size,
    color: Blue,
    key: Reprocessing.Events.K,
  },
  {
    x: Common.width / 2 - size / 2 + padd * 2,
    y: Common.subHeight(yPos),
    w: size,
    h: size,
    color: Orange,
    key: Reprocessing.Events.L,
  },
]

let draw = (~x, ~y, ~w, ~h, ~color, ~isPressed, ~key, env) => {
  open Reprocessing

  let {r, g, b, a} = Color.toRgba(color)
  let color = isPressed ? Constants.black : Utils.color(~r, ~g, ~b, ~a)

  Draw.fill(color, env)
  Draw.rect(~pos=(x, y), ~width=w, ~height=h, env)
  Draw.text(~body=keyToString(key), ~pos=(x + 15, y + 10), env)
}
