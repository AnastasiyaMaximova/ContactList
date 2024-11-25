//
//  PersonListViewController.swift
//  ContactList
//
//  Created by Anastasya Maximova on 21.11.2024.
//

import UIKit

final class PersonsListViewController: UITableViewController {

   private let persons = Person.getPersonList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let controllers = tabBarController?.viewControllers
        controllers?.forEach { viewController in
            let navigationVC = viewController as? UINavigationController
            let detailedPersonsListVC = navigationVC?.topViewController as? DetailedPersonsListViewController
            detailedPersonsListVC?.persons = persons
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        guard let indexPath = tableView.indexPathForSelectedRow else {return}
        let personInfoVC = segue.destination as? PersonInfoViewController
        personInfoVC?.person = persons[indexPath.row]
    }
}

//MARK: - Set cell configuration
    
extension PersonsListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        let person = persons[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = person.fullName
        cell.contentConfiguration = content
        return cell
    }
        
}
