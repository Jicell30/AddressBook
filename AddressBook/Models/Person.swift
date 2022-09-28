//
//  Person.swift
//  AddressBook
//
//  Created by Jicell on 9/26/22.
//

import Foundation
class Person: Codable {
    let id: UUID
    var name: String
    var address: String
    
    // Initializer
    init(id: UUID = UUID(), name: String, address: String){
        self.id = id
        self.name = name
        self.address = address
    }
} // End of class

extension Person: Equatable {
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.id == rhs.id &&
        lhs.name == rhs.name &&
        lhs.address == rhs.address
    }
}
