type t =
  | Green
  | Red
  | Blue
  | Yellow
  | Orange

type rgb = {r: int, g: int, b: int, a: int}

let toRgba = color => {
  switch color {
  | Green => {r: 0, g: 100, b: 0, a: 255}
  | Red => {r: 255, g: 0, b: 0, a: 255}
  | Blue => {r: 0, g: 0, b: 255, a: 255}
  | Yellow => {r: 255, g: 255, b: 0, a: 255}
  | Orange => {r: 249, g: 105, b: 14, a: 255}
  }
}
