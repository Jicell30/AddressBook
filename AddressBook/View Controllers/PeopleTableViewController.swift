//
//  PeopleTableViewController.swift
//  AddressBook
//
//  Created by Jicell on 9/26/22.
//

import UIKit

class PeopleTableViewController: UITableViewController {

    @IBOutlet weak var groupNameTextField: UITextField!
    var group: Group?
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        groupNameTextField.text = group?.name
        tableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        guard let group = group,
            let newName = groupNameTextField.text
        else { return }
        GroupController.sharedInstance.updateGroup(groupToUpdate: group, newName: newName)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return group?.people.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath)
        let person = group?.people[indexPath.row]
        cell.textLabel?.text = person?.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let group = group else { return}
            let person = group.people[indexPath.row]
            PersonController.deletePerson(personToDelete: person, group: group)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "toPersonDetail",
              let personDetailViewController = segue.destination as? PersonDetailViewController,
              let selectedRow = tableView.indexPathForSelectedRow?.row
        else { return }
        let person = group?.people[selectedRow]
        personDetailViewController.person = person
    }
    
    // MARK: - Actions
    //@IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
       // guard let group = group else { return }
      //  PersonController.createPerson(group: group)
   //     tableView.reloadData()}
 
    
    @IBAction func addButtonTapped(_ sender: Any) {
        print("hello")
        guard let group = group else { return }
        PersonController.createPerson(group: group)
        tableView.reloadData()
        
    }
    
    
    
}
