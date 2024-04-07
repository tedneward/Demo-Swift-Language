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
  // {{## END methods ##}}
  // {{## BEGIN mutating-methods ##}}
  mutating func move(x: Int32, y: Int32) -> Void {
    // Two ways to do this: 
    // assignment to properties...
    // self.x = x; self.y = y
    // ... or assignment to self
    self = Point(x: self.x + x, y: self.y + y)
  }
  // {{## END mutating-methods ##}}
  
  
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
  
  init(firstName fn: String, lastName ln : String,
    age: UInt8, location loc: Point?)
  {
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
  // This is a read-only computed property
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
var ted = Person(firstName:"Ted", lastName:"Neward", age:42, location:nil)
var ted2 = ted
  // These point to the same object
ted.firstName = "Theodore"
print(ted.stringified)
print(ted2.stringified) // "Theodore"
// {{## END identity ##}}

// {{## BEGIN inheritance ##}}
class Student : Person
{
  // Student has everything defined on Person
}
// {{## END inheritance ##}}
