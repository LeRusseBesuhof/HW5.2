import Foundation

struct CellItem : Identifiable {
    var id : String = UUID().uuidString
    var mainImage : String
    var subPages : [String]
    
    static func mockData() -> [CellItem] {
        [
            CellItem(mainImage: "mainCar", subPages: ["car1", "car2", "car3"]),
            CellItem(mainImage: "mainTrain", subPages: ["train1", "train2", "train3"]),
            CellItem(mainImage: "mainPlane", subPages: ["plane1", "plane2", "plane3"])
        ]
    }
}
