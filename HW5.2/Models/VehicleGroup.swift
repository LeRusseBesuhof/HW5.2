import Foundation

struct VehicleGroup : Identifiable {
    var id : String = UUID().uuidString
    var title : String
    var info : String
    var mainImage : String
    var subImages : [String]
    
    static func mockData() -> [VehicleGroup] {
        [
            VehicleGroup(
                title: "Cars",
                info: "A car is a motor vehicle with wheels. Most definitions of have four wheels and mainly transport people",
                mainImage: "mainCar",
                subImages: ["car1", "car2", "car3"]),
            VehicleGroup(
                title: "Trains",
                info: "A train is a series of connected vehicles that run along a railway track and transport people or freight",
                mainImage: "mainTrain",
                subImages: ["train1", "train2", "train3"]),
            VehicleGroup(
                title: "Planes",
                info: "A plane is a vehicle that is able to fly by gaining support from the air",
                mainImage: "mainPlane",
                subImages: ["plane1", "plane2", "plane3"])
        ]
    }
}
