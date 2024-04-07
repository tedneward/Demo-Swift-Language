let name = "Frodo"
print(type(of: name))

let typeOfName = type(of: name)
let nameTwo = typeOfName.init(describing: 1)
print(nameTwo)

class Person {
    let firstName : String
    let lastName : String
    init(firstName f : String, lastName l : String) {
        firstName = f
        lastName = l
    }
}
let p = Person(firstName: "Frodo", lastName: "Baggins")
let ptype = type(of: p)
print(ptype)
