import Foundation

// {{## BEGIN struct-equals ##}}
struct Point {
  // standard properties
  var x : Int32
  var y : Int32
  init(x:Int32, y:Int32) {
    self.x = x
    self.y = y
  }
  static func ==(left: Point, right: Point) -> Bool {
    return (left.x == right.x) && (left.y == right.y)
  }
  static func !=(left: Point, right: Point) -> Bool {
    return (left.x != right.x) || (left.y != right.y)
  }
}
let origin = Point(x: 0, y: 0)
let anotherPt = Point(x: 1, y: 1)
if origin != anotherPt {
  print("Nope! Different places on the grid")
}
if origin == anotherPt {
  print("They point to the same place!")
}
// {{## END struct-equals ##}}

// {{## BEGIN custom-operator ##}}
infix operator <==>
extension Point {
  static func <==>(left: Point, right: Point) -> Point {
    return Point(x: left.x, y: right.y)
  }
}
let ufoPt = origin <==> anotherPt
print(ufoPt)
// {{## END custom-operator ##}}

// {{## BEGIN simple-operator ##}}
func +(left: [Double], right: [Double]) -> [Double] {
    var sum = [Double](repeating: 0.0, count: left.count)
    for (i, _) in left.enumerated() {
        sum[i] = left[i] + right[i]
    }
    return sum
}
let result = [1.0, 2.0] + [3, 4]
print(result)
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
