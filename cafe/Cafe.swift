import Foundation

struct Cafe: Decodable {
    var id: String?
    var name: String?
    var city: String?
    var wifi: Float?
    var seat: Float?
    var quiet: Float?
    var tasty: Float?
    var cheap: Float?
    var music: Float?
    var url: String?
    var address: String?
    var latitude: String?
    var longitude: String?
    var limited_time: String?
    var socket: String?
    var standing_desk: String?
    var mrt: String?
    var open_time: String?
}

class Cafee {
    static var shareData = [Cafe]()
}
