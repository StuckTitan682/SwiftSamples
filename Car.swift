class Car {
    let numberOfWheels: Int = 4
    let hasSteeringWheel: Bool = true
    let hasHeadlights: Bool = true

    func drive() {
        print("VROOOOOOOOOOM!!!!!!")
    }

    func stop() {
        print("SCREEEEEEEEEEEECH!!!!!")
    }
}

class OldCar: Car {
    let numberOfSeats: Int = 4
    let trunkSize: Int = 100
}

class SportsCar: Car {
    let numberOfSeats: Int = 2
    let trunkSize: Int = 10

    func fly() {
        print("FLY ME TO THE MOON!")
    }
}

class PickupTruck: Car {
    let numberOfSeats: Int = 4
    let trunkSize: Int = 500
}

let toyota = OldCar()
print(toyota.numberOfWheels)
print(toyota.hasHeadlights)
print(toyota.trunkSize)

let mazda = SportsCar()
print(mazda.trunkSize)

let hilux = PickupTruck()
print(hilux.trunkSize)

