// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

struct Store: Codable {
    var pets: [Pet]

    init(pets: [Pet]) {
        self.pets = pets
    }
}