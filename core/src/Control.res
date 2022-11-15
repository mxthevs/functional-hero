type state = {
  green: bool,
  red: bool,
  yellow: bool,
  blue: bool,
  orange: bool,
}

let init = {
  green: false,
  red: false,
  yellow: false,
  blue: false,
  orange: false,
}

let keyDown = (code, state) => {
  open Reprocessing_Events
  switch code {
  | A => {...state, green: true}
  | S => {...state, red: true}
  | J => {...state, yellow: true}
  | K => {...state, blue: true}
  | L => {...state, orange: true}
  | _ => state
  }
}

let keyUp = (code, state) => {
  open Reprocessing_Events
  switch code {
  | A => {...state, green: false}
  | S => {...state, red: false}
  | J => {...state, yellow: false}
  | K => {...state, blue: false}
  | L => {...state, orange: false}
  | _ => state
  }
}
