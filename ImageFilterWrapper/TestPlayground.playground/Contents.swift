import ImageFilterWrapper

let image = UIImage(named: "lion.png")!

/////////// Color Effects

let monochromeFilter: ImageFilter = .ColorEffect(.ColorMonochrome(color: UIColor.purple,
                                                                  intensity: 1.2))
let monochromeImage = image.applyFilters(monochromeFilter)

/////////// Stylizing Effects

let crystallizeFilter: ImageFilter = .Stylize(.Crystallize(radius: 10,
                                                           center: nil))
let crystallizeImage = image.applyFilters(crystallizeFilter)

/////////// Tile Effects

let kaleidoscopeFilter: ImageFilter = .TileEffect(.Kaleidoscope(count: 8,
                                                                center: CGPoint(x:320, y: 250),
                                                                angle: 0.55))
let kaleidoscopeImage = image.applyFilters(kaleidoscopeFilter)

/////////// Combination

let comboImage = image.applyFilters(monochromeFilter,
                                    crystallizeFilter,
                                    kaleidoscopeFilter)