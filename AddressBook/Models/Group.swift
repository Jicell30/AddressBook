//
//  Group.swift
//  AddressBook
//
//  Created by Jicell on 9/26/22.
//

import Foundation

class Group: Codable {
    let id: UUID
    var name: String
    var people: [Person]
    
    //initializer
    init(id: UUID = UUID(), name: String, people: [Person] = []){
        self.id = id
        self.name = name
        self.people = people
        
    }
} //End of class

extension Group: Equatable {
    static func == (lhs: Group, rhs: Group) -> Bool {
        return lhs.id == rhs.id &&
        lhs.name == rhs.name &&
        lhs.people == rhs.people
    }
}
