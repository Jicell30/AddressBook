//
//  PersonModelController.swift
//  AddressBook
//
//  Created by Jicell on 9/26/22.
//

import Foundation

class PersonController {
    // single source of truth
    static let sharedInstance = PersonController()
    // SOT
   private(set) var people: [Person] = []
    
    // CRUD
    //Create Function
    static func createPerson(name: String = "New Contact", address: String = "",
        group: Group){
        let person = Person(name: name, address: address)
        group.people.append(person)
    
  }
    //update function
    static func updatePerson(personToUpdate: Person, newName: String, newAddress: String) {
        personToUpdate.name = newName
        personToUpdate.address = newAddress
    }
    
    //delete function
    static func deletePerson(personToDelete: Person, group: Group) {
        guard let indexPersonToDelete = group.people.firstIndex(of: personToDelete) else {return}
        group.people.remove(at: indexPersonToDelete)
    }
}
