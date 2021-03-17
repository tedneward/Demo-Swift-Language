import Foundation

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

