import Foundation

func printMachine(text : String, numberOfTimes : Int) {
    for _ in 1...numberOfTimes {
        print(text)
    }
}

printMachine(text : "I love swift!", numberOfTimes : 4)

print("------------------")

class Dog {
    var name = ""
    var age = 0
    var color = ""
    
    func bark() {
        print("Woof! My name is \(name) and I am \(age) years old.")
    }
}



var myDog = Dog()
myDog.age = 10
myDog.name = "Cisco"
myDog.color = "Tan"

myDog.bark()

var dog2 = Dog()
dog2.age = 6
dog2.name = "Zoe"
dog2.color = "Black & Brown"

dog2.bark()

print("------------------")

class MtnDew {
    var flavor = ""
    var color = ""
    var type = ""
    func drink() {
        print("I have a Mtn Dew! It's \(flavor), \(color), and in a \(type).")
    }
}

var Dew = MtnDew()
Dew.flavor = "Major Melon"
Dew.color = "Pink & Green"
Dew.type = "Can"

Dew.drink()
