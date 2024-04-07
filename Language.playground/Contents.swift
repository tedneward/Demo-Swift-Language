import Cocoa
import Foundation

print("Hello world!")

/*
Basics
 */
do
{
// {{## BEGIN locals ##}}
let money = 42000
// let moneyD : Double = money // Illegal
let moneyD2 : Double = Double(money)

var moneyD = 42000
moneyD = 50000
// {{## END locals ##}}

// {{## BEGIN string-interpolation ##}}
let age = 42
let message = "He is \(age) years old"
print(message)
// {{## END string-interpolation ##}}


do
{
// {{## BEGIN if ##}}
var temperatureInFahrenheit = 30
if temperatureInFahrenheit <= 32 {
  print("It's very cold. Consider wearing a scarf.")
}
else if temperatureInFahrenheit > 80 {
  print("Holy crud! It's hot!")
}
else {
  print("Quit yer whinin'.")
}
// {{## END if ##}}

// {{## BEGIN switch-1 ##}}
let temp = 30
switch temp {
  case 0:
    print("Brr! Freezing!")
  case 1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
       11, 12, 13, 14, 15, 16, 17, 18:
    print("Still damn cold!")
  default:
    print("Meh")
}
// {{## END switch-1 ##}}

// {{## BEGIN switch-range ##}}
switch temp {
  case 0:
    print("Brr! Freezing!")
  case 1...32:
    print("Still damn cold!")
  default:
    print("Meh")
}
// {{## END switch-range ##}}

// {{## BEGIN switch-local ##}}
let aPoint = (2, 0)
switch aPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}
// {{## END switch-local ##}}

// {{## BEGIN switch-where ##}}
let anotherPoint = (1, -1)
switch anotherPoint {
case let (x, y) where x == y:
    print("on the identity slope")
case let (x, y) where x == -y:
    print("on the negative identity slope")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}
// {{## END switch-where ##}}

// {{## BEGIN while ##}}
var index : Int = 0
while index < 5 {
  print("This is the \(index)th time I've said this")
  index += 1
}
// {{## END while ##}}

// {{## BEGIN do-while ##}}
var anotherIndex : Int = 0
repeat {
  print("This is the \(index)th time I've said this")
  anotherIndex += 1
} while anotherIndex < 5
// {{## END do-while ##}}

// {{## BEGIN for-in ##}}
for index in 1...5 {
  print("\(index) times 5 equals \(index * 5)")
}
for _ in 1...5 {
  print("I don't care about the index; just print 5 times")
}
// {{## END for-in ##}}

// {{## BEGIN guard ##}}
func greet(person: [String: String]) {
  guard let name = person["name"] else {
    return
  }
  print("Hello \(name)!")
  
  guard let location = person["location"] else {
    print("I hope the weather is nice near you.")
    return
  }
  print("I hope the weather is nice in \(location).")
}
 
greet(person: ["name": "John"])
greet(person: ["name": "Jane", "location": "Cupertino"])
// {{## END guard ##}}
}
    

/*
Functions
 */
do
{
// {{## BEGIN simple ##}}
func sayHello(personName : String) -> String {
    return "Hello, \(personName)"
}
print(sayHello(personName: "Fred"))
// {{## END simple ##}}
}


do {
// {{## BEGIN shorthand ##}}
func rollDice(numberOfDice : UInt, times : UInt, withBonus : UInt) -> [UInt] {
    var results : [UInt] = []
    for _ in 1...times {
        var accum : UInt = 0
        for _ in 1...numberOfDice {
            let dieRoll = UInt(arc4random_uniform(6) + 1)
            accum += dieRoll
        }
        results.append (accum + withBonus)
    }
    
    return results
}
let dieRolls = rollDice(numberOfDice: 3, times: 6, withBonus: 0)
print(dieRolls)
// {{## END shorthand ##}}
}


do {
// {{## BEGIN extern-names ##}}
func rollDice(numberOfDice num : UInt, times t : UInt, withBonus bonus : UInt) -> [UInt] {
    var results : [UInt] = []
    for _ in 1...t {
        var accum : UInt = 0
        for _ in 1...num {
            let dieRoll = UInt(arc4random_uniform(6) + 1)
            accum += dieRoll
        }
        results.append (accum + bonus)
    }
  
    return results
}
let dieRolls = rollDice(numberOfDice: 3, times: 6, withBonus: 0)
print(dieRolls)
// {{## END extern-names ##}}
}


do {
// {{## BEGIN default-names ##}}
func rollDice(_ num : UInt, times t : UInt, withBonus bonus : UInt) -> [UInt] {
    var results : [UInt] = []
    for _ in 1...t {
        var accum : UInt = 0
        for _ in 1...num {
            let dieRoll = UInt(arc4random_uniform(6) + 1)
            accum += dieRoll
        }
        results.append (accum + bonus)
    }
  
    return results
}
let dieRolls = rollDice(3, times: 6, withBonus: 0)
print(dieRolls)
// {{## END default-names ##}}
}


do {
// {{## BEGIN default-params ##}}
func rollDice(numberOfDice : UInt, times : UInt, withBonus : UInt = 0) -> [UInt] {
    var results : [UInt] = []
    for _ in 1...times {
        var accum : UInt = 0
        for _ in 1...numberOfDice {
            let dieRoll = UInt(arc4random_uniform(6) + 1)
            accum += dieRoll
        }
        results.append (accum + withBonus)
    }
  
    return results
}
let dieRolls = rollDice(numberOfDice: 3, times: 6)
print(dieRolls)
// {{## END default-params ##}}
}


do {
// {{## BEGIN variadic ##}}
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
print(arithmeticMean(1, 2, 3, 4, 5))
// {{## END variadic ##}}
}


do {
// {{## BEGIN anonymous ##}}
let addFunc = { (left : Int, right : Int) -> Int in return left + right }
print("1 + 2 = \(addFunc(1,2))")
// {{## END anonymous ##}}
}


do {
// {{## BEGIN inferred ##}}
let addFunc : (Int, Int) -> Int = { (left, right) in return left + right }
print("1 + 2 = \(addFunc(1,2))")
// {{## END inferred ##}}
}


do {
// {{## BEGIN inferred-return ##}}
let addFunc : (Int, Int) -> Int = { (left, right) in left + right }
print("1 + 2 = \(addFunc(1,2))")
// {{## END inferred-return ##}}
}


do {
// {{## BEGIN inferred-params ##}}
let addFunc : (Int, Int) -> Int = { $0 + $1 }
print("1 + 2 = \(addFunc(1,2))")
// {{## END inferred-params ##}}
}


do {
// {{## BEGIN func-values ##}}
func mathOp(left : Int, right : Int, op : (Int, Int) -> Int) -> Int {
    return op(left, right)
}
// {{## END func-values ##}}
}


do {
// {{## BEGIN nested ##}}
func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backwards ? stepBackward : stepForward
}
var currentValue = -2
let moveNearerToZero = chooseStepFunction(backwards: currentValue > 0)
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")
// -2...
// -1...
// zero!
// {{## END nested ##}}
}


do {
// {{## BEGIN trailing ##}}
func mathOp(left : Int, right : Int, op : (Int, Int) -> Int) -> Int {
    return op(left, right)
}
let result = mathOp(left: 1, right: 2) { $0 + $1 }
print("Result = \(result)")
// {{## END trailing ##}}
}

}


/*
Simple Types
 */
do
{
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
}


/*
Complex Types
 */
// {{## BEGIN struct ##}}
struct Point {
  // standard properties
  var x : Int32
  var y : Int32

  // computed read-only property
  var stringified : String {
    get { return "(\(x),\(y))" }
  }
  
  // observed property
  var name : String = "" {
    willSet(newName) {
      print("Changing \(name) to \(newName)")
    }
    didSet {
      print("Changed to \(name)")
    }
  }
  
  // static property (singleton)
  static let ORIGIN = Point(x: 0, y: 0, name:"ORIGIN")
  // {{## END struct ##}}

  // {{## BEGIN methods ##}}
// ... still in struct Point ...
  func stringRep() -> String {
    return "(\(self.x),\(self.y))"
  }
  static func compare(left: Point, right: Point) -> Bool {
    return (left.x == right.x) && (left.y == right.y)
  }
  func move(x: Int32, y: Int32) -> Void {
    // Two ways to do this:
    // assignment to properties...
    // self.x = x; self.y = y
    // ... or assignment to self
    //self = Point(x: self.x + x, y: self.y + y)
  }
  // {{## END methods ##}}
  
  
  // {{## BEGIN initializers ##}}
  init(x:Int32, y:Int32) {
    self.x = x
    self.y = y
  }
  init(x:Int32, y:Int32, name: String) {
    self.x = x
    self.y = y
    self.name = name
  }
  init(y: Int32, x: Int32) {
    self.x = x
    self.y = y
  }
  init(pt: Point, offsetX: Int32 = 0, offsetY : Int32 = 0) {
    self = pt
    self.move(x: offsetX, y:offsetY)
  }
}
// {{## END initializers ##}}

// {{## BEGIN instantiation ##}}
var aPoint = Point(x:2, y:3)
print("aPoint = \(aPoint.stringified)")
var anotherPoint = aPoint
aPoint.x = 12
print("anotherPoint = \(anotherPoint), aPoint = \(aPoint)")
// {{## END instantiation ##}}
  
// {{## BEGIN methods ##}}
var o = Point.ORIGIN
print(o.stringRep())
if Point.compare(left: o, right: Point.ORIGIN) {
  print("Yep, they point to the same place")
}
o.move(x: 3, y:5)
print(o.stringRep())
// {{## END methods ##}}

  
// {{## BEGIN class ##}}
class Person {
  var firstName : String
  var lastName : String
  var age : UInt8
  var location: Point

    static var population : UInt = 0
    
    var fullName : String {
        get {
            return firstName + " " + lastName
        }
    }
  
  init(firstName fn: String = "", lastName ln : String = "",
    age: UInt8 = 0, location loc: Point? = nil)
  {
      Person.population += 1

    self.firstName = fn
    self.lastName = ln
    self.age = age
    if loc == nil {
      self.location = Point.ORIGIN
    }
    else {
      self.location = loc!
    }
  }
// {{## END class ##}}
// {{## BEGIN class-2 ##}}
  var stringified : String {
    get {
      return "[Person lastName:\(lastName) " +
        "firstName:\(firstName) " +
        "age:\(age) " +
        "location:\(location.stringified) " +
        "]"
    }
  }
}
// {{## END class-2 ##}}
  
// {{## BEGIN identity ##}}
var ted = Person(firstName: "", lastName: "Neward", age: 42, location: nil)
print(ted.firstName)
var ted2 = ted
  // These point to the same object
ted.firstName = "Theodore"
print(ted.fullName)
print(ted.stringified)
print(ted2.stringified) // "Theodore"
// {{## END identity ##}}

let pt = Point(x: 0, y: 0)
pt.move(x: 5, y: 5)

// {{## BEGIN inheritance ##}}
class Student : Person
{
  // Student has everything defined on Person
}
// {{## END inheritance ##}}


/*
Errors
 */
// {{## BEGIN type ##}}
enum VendingMachineError: Error {
    case InvalidSelection(desired: String)
    case InsufficientFunds(coinsNeeded: Int)
    case OutOfStock
}
// {{## END type ##}}

// {{## BEGIN vending-machine ##}}
struct Item {
    var price: Int
    var count: Int
}
class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0
    func dispenseSnack(snack: String) {
        print("Dispensing \(snack)")
    }
// {{## END vending-machine ##}}
    
// {{## BEGIN throws ##}}
    func vend(itemNamed name: String) throws -> String {
// {{## END throws ##}}

// {{## BEGIN throw ##}}
        guard var item = inventory[name] else {
            throw VendingMachineError.InvalidSelection(desired: name)
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.OutOfStock
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.InsufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        item.count -= 1
        inventory[name] = item
        dispenseSnack(snack: name)
        return name
// {{## END throw ##}}
    }
}

// {{## BEGIN do-catch ##}}
let vm = VendingMachine()
do {
    vm.coinsDeposited = 12
    try vm.vend(itemNamed: "Diet Coke")
}
catch VendingMachineError.OutOfStock {
    print("I don't have any of that")
}
catch VendingMachineError.InsufficientFunds(let coinsReq) {
    print("You need more money: \(coinsReq), to be precise")
}
catch VendingMachineError.InvalidSelection(let desired)
    where desired == "Diet Coke" {
    print("Sorry, we're a Pepsi place")
}
catch VendingMachineError.InvalidSelection(_) {
    print("We don't carry that")
}
catch {
    print("We really have no idea what went wrong")
}
// {{## END do-catch ##}}

// {{## BEGIN try ##}}
vm.coinsDeposited = 10
let chips = try? vm.vend(itemNamed: "Chips")
print(chips)
let coke = try? vm.vend(itemNamed: "Coke")
print(coke)
//let drPepper = try! vm.vend(itemNamed: "Dr Pepper")
    // BOOM: "fatal error: 'try!' expression unexpectedly ...
// {{## END try ##}}


/*
Extensions
 */
// {{## BEGIN defining1 ##}}
extension Double {
  var km: Double { return self * 1_000.0 }
  var m: Double { return self }
  var cm: Double { return self / 100.0 }
  var mm: Double { return self / 1_000.0 }
  var ft: Double { return self / 3.28084 }
}
print("3ft equals \(3.ft) meters")
// {{## END defining1 ##}}

// {{## BEGIN defining2 ##}}
extension Int {
  func repetitions(task: () -> Void) {
    for _ in 0..<self {
      task()
    }
  }
}
3.repetitions {
  print("Hello!")
}
// {{## END defining2 ##}}


/*
KeyValue
 */
do
{
// {{## BEGIN class-decl ##}}
class Person : NSObject {
  @objc dynamic var firstName = ""
  @objc dynamic var lastName = ""
  @objc dynamic var age = 0
}
let p = Person()
p.firstName = "Fred"
// {{## END class-decl ##}}
// {{## BEGIN class-kp ##}}
let pkeyPath = #keyPath(Person.firstName)
if let value = p.value(forKey: pkeyPath) {
  print(value)  // "Fred"
}
if let value = p.value(forKey: "firstName") {
  print(value)  // "Fred"
}
// {{## END class-kp ##}}

// {{## BEGIN class-observe ##}}
// recall that p = Person(), p.firstName = "Fred"
// recall that pkeyPath = #keyPath(Person.firstName)
let result = p.observe(\.firstName) { person, change in
  print("firstName change on \(person) to \(change)")
}
let result2 = p.observe(\.firstName, options: [.old, .new]) { person, change in
  print("\(person) changed to \(change)")
}
p.setValue("Barney", forKey: pkeyPath)
p.setValue("Wilma", forKey: "firstName")
p.firstName = "Fred"
// {{## END class-observe ##}}
// {{## BEGIN class-subject-observer ##}}
class Observer : NSObject {
  override func observeValue(forKeyPath keyPath: String?,
      of object: Any?, change: [NSKeyValueChangeKey : Any]?,
      context: UnsafeMutableRawPointer?) {
    if keyPath == "firstName" {
      print("Observing a change to firstName: \(change!) on \(object!)")
    }
  }
}
let o = Observer()
p.addObserver(o, forKeyPath: "firstName", options: .new, context: nil)
p.setValue("Barney", forKey: "firstName")
print(p.firstName)
// {{## END class-subject-observer ##}}
}

// {{## BEGIN string-todatetime ##}}
extension String {
  func toDateTime() -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    return dateFormatter.date(from: self)!
  }
}
// {{## END string-todatetime ##}}

// {{## BEGIN collection-operator-setup ##}}
class Transaction: NSObject {
  @objc var payee: String
  @objc var amount: Float
  @objc var date: Date
  init(_ p: String, _ a: Float, _ d: Date) {
    self.payee = p
    self.amount = a
    self.date = d
  }
}
// {{## END collection-operator-setup ##}}
// {{## BEGIN collection-operator-2 ##}}
let transactions = [
  Transaction("Green Power", 120.00, "2015-12-01".toDateTime()),
  Transaction("Cable", 130.00, "2015-12-01".toDateTime()),
  Transaction("Green Power", 150.00, "2016-01-01".toDateTime()),
  Transaction("Mortgage", 1250.00, "2016-01-05".toDateTime()),
  Transaction("Car Loan", 250.00, "2016-01-15".toDateTime()),
  Transaction("Green Power", 170.00, "2016-02-01".toDateTime()),
  Transaction("Car Loan", 250.00, "2016-02-15".toDateTime()),
  Transaction("Car Loan", 250.00, "2016-03-15".toDateTime()),
]
print((transactions as NSArray).value(forKeyPath:"@avg.amount")!)
print((transactions as NSArray).value(forKeyPath:"@max.date")!)
print((transactions as NSArray).value(forKeyPath:"@count")!)
// {{## END collection-operator-2 ##}}


/*
Operators
 */
// {{## BEGIN simple-operator ##}}
func +(left: [Double], right: [Double]) -> [Double] {
    var sum = [Double](repeating: 0.0, count: left.count)
    for (i, _) in left.enumerated() {
        sum[i] = left[i] + right[i]
    }
    return sum
}
let opresult = [1.0, 2.0] + [3.0, 4.0]
print(opresult)
// {{## END simple-operator ##}}

// {{## BEGIN mixed-operator ##}}
func * (left: String, right: Int) -> String {
    if right <= 0 {
        return ""
    }
    var result = left
    for _ in 1..<right {
        result += left
    }
    return result
}
let scream = "a" * 6
print(scream)
// {{## END mixed-operator ##}}

// {{## BEGIN vector ##}}
struct Vector: CustomStringConvertible {
  let x: Int
  let y: Int
  let z: Int

  var description: String {
    return "(\(x), \(y), \(z))"
  }

  init(_ x: Int, _ y: Int, _ z: Int) {
    self.x = x
    self.y = y
    self.z = z
  }
  // {{## END vector ##}}

  // {{## BEGIN vector-ops ##}}
  static func +(left: Vector, right: Vector) -> Vector {
    return Vector(left.x + right.x,
      left.y + right.y, left.z + right.z)
  }
  static prefix func -(vector: Vector) -> Vector {
    return Vector(-vector.x, -vector.y, -vector.z)
  }
  // {{## END vector-ops ##}}
}
let vectorA = Vector(1, 3, 2)
let vectorB = Vector(-2, 5, 1)
print(vectorA + vectorB)


/*
Protocols
 */
// {{## BEGIN protocol ##}}
protocol FullyNamed {
    var fullName : String { get }
}

protocol RandomNumberGenerator {
    func random() -> Double
}
// {{## END protocol ##}}


// {{## BEGIN implementing ##}}
struct FullyNamedPerson : FullyNamed {
    var fullName : String
}

class LinearCongruentialGenerator:
    RandomNumberGenerator {

    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
      lastRandom = (lastRandom * a + c).truncatingRemainder(dividingBy: m)
      return lastRandom / m
    }
}
// {{## END implementing ##}}

// {{## BEGIN delegates ##}}
class Dice {
    let sides : Int
    let generator : RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
      self.sides = sides
      self.generator = generator
    }
    func roll() -> Int {
      return Int(generator.random() * Double(sides)) + 1
    }
}
protocol DiceGame {
    var dice : Dice { get }
    func play()
}
protocol DiceGameDelegate {
    func gameDidStart(game: DiceGame)
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(game: DiceGame)
}
// {{## END delegates ##}}

