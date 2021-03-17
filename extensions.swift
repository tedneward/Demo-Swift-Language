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




