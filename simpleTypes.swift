// {{## BEGIN arrays ##}}
var shoppingList : [String] =
  ["catfish", "water", "tulips", "blue paint"]
shoppingList[1] = "bottle of water"
print("I bought a \(shoppingList[1])")
print("She bought \(shoppingList)")

// Use for-in over an array
let names = ["Alice", "Bob", "Mallory", "Eve", "Trent"]
for name in names {
  print("Hello, \(name)!")
}
// {{## END arrays ##}}


// {{## BEGIN dictionaries ##}}
var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
]
occupations["Jayne"] = "Public Relations"
let malJob = occupations["Malcolm"]
print("Mal is the \(malJob)")
print("People work as \(occupations)")

var explore = [ 4.5 : "StringValue" ]
print("Can we key by doubles? \(explore[4.5])")

// Use for-in over dictionaries
for (key, value) in occupations {
  print("\(key) is the \(value)")
}
// {{## END dictionaries ##}}


// {{## BEGIN optionals ##}}
var theAnswer = 42
var maybeTheAnswer : Int? = theAnswer
maybeTheAnswer = nil
print("The answer is \(theAnswer)")
//print("... but it might be \(maybeTheAnswer!)")
    // Since maybeTheAnswer is nil, this will generate
    // an exception at runtime
if (maybeTheAnswer != nil) {
    print("The answer is \(maybeTheAnswer!)")
}
// {{## END optionals ##}}

// {{## BEGIN enums ##}}
enum CompassPoint {
    case North
    case South
    case East
    case West
}
enum Planet {
    case Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

var direction = CompassPoint.North
switch direction {
    case .North: print("Brrr cold")
    case .South: print("Watch out for penguins")
    case .West : print("Where rises the Sun")
    case .East : print("Where sets the Sun")
}
// {{## END enums ##}}

do {
// {{## BEGIN enums-raw ##}}
enum Planet: Int {
    case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}
let planet = Planet(rawValue: 3)
  // planet is set to .Earth
let planetIndex = Planet.Earth.rawValue
  // planetIndex is 3
// {{## END enums-raw ##}}
}

// {{## BEGIN enums-associated ##}}
enum Barcode {
  case UPCA(Int, Int, Int)
  case QRCode(String)
}
let barcode = Barcode.UPCA(8, 85909_51226, 3)
// or
let barcode2 = Barcode.QRCode("8A9873CEFAE")
// {{## END enums-associated ##}}

// {{## BEGIN tuples ##}}
var city = ("Seattle", "Washington", 5000000)
var person = ("Teresa", "Nguyen", 39)
var ssi = city
ssi = person
    // Structurally typed!
print(ssi)
print(ssi.0)
// {{## END tuples ##}}

// {{## BEGIN tuple-destructuring ##}}
var team : (name : String, association : String, wins : Int) =
    ("Sounders", "MLS", 15)
print(team)
print("The \(team.name) have won \(team.wins) times")
// {{## END tuple-destructuring ##}}

// {{## BEGIN tuple-switch ##}}
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("(0, 0) is at the origin")
case (_, 0):
    print("(\(somePoint.0), 0) is on the x-axis")
case (0, _):
    print("(0, \(somePoint.1)) is on the y-axis")
case (-2...2, -2...2):
    print("(\(somePoint.0), \(somePoint.1)) is inside the box")
default:
    print("(\(somePoint.0), \(somePoint.1)) is outside of the box")
}
// {{## END tuple-switch ##}}






