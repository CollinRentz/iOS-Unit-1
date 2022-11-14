import UIKit

var greeting = "Hello, playground"

enum Car: String {
    case tesla = "Tesla Model X"
    case kia = "Kia Optima"
    case bmw = "BMW"
    case pontiac = "Pontiac G5"
    case ford = "Ford Explorer"
}

struct Person {
    var name = ""
    var favoriteCar = ""
}

let collin = Person(name: "Collin", favoriteCar: Car.tesla.rawValue)

let madelyn = Person(name: "Madelyn", favoriteCar: Car.kia.rawValue)

let nick = Person(name: "Nick", favoriteCar: Car.bmw.rawValue)

let ron = Person(name: "Ron", favoriteCar: Car.pontiac.rawValue)

let lisa = Person(name: "Lisa", favoriteCar: Car.ford.rawValue)

var people = [collin, madelyn, nick, ron, lisa]

for Person in people {
    print("\(Person.name)'s favorite car maker is a \(Person.favoriteCar)")
}

