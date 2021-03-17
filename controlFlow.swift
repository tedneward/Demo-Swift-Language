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
