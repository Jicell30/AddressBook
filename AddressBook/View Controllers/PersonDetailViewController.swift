//
//  PersonDetailViewController.swift
//  AddressBook
//
//  Created by Jicell on 9/26/22.
//

import UIKit

class PersonDetailViewController: UIViewController {

    //MARK: -IBOutlets
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var addressTextField: UITextField!
    
    //MARK: -Properties
    var person: Person?
    
    //MARK: -Methods
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViews()
    }
    
    func updateViews() {
        guard let person = person else
        {return}
        nameTextField.text = person.name
        addressTextField.text = person.address
        
    }
    
   //MARK: -IBActions
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let person = person,
              let name =
                nameTextField.text,
              let address =
                addressTextField.text
        else {return}
        PersonController.updatePerson(personToUpdate: person, newName: name, newAddress: address)
        self.navigationController?
            .popViewController(animated: true)
    }
    
}
