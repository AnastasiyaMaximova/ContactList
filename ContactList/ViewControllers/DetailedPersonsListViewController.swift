//
//  DetailedPersonsListViewController.swift
//  ContactList
//
//  Created by Anastasya Maximova on 21.11.2024.
//

import UIKit

final class DetailedPersonsListViewController: UITableViewController {
    
    var persons: [Person]!
}

//MARK: - Set cell configuration
extension DetailedPersonsListViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        persons.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = persons[indexPath.section]
        if indexPath.row == 0 {
            let phoneCell = tableView.dequeueReusableCell(withIdentifier: "phoneCell", for: indexPath)
            var phoneCellContent = phoneCell.defaultContentConfiguration()
            phoneCellContent.text = person.phone
            phoneCellContent.image = UIImage(systemName: "phone")
            phoneCell.contentConfiguration = phoneCellContent
            phoneCell.selectionStyle = .none
            return phoneCell
        }
        else {
            let emailCell = tableView.dequeueReusableCell(withIdentifier: "emailCell", for: indexPath)
            var emailCellContent = emailCell.defaultContentConfiguration()
            emailCellContent.text = person.email
            emailCellContent.image = UIImage(systemName: "envelope.open")
            emailCell.contentConfiguration = emailCellContent
            emailCell.selectionStyle = .none
            return emailCell
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let person = persons[section]
        return person.fullName
    }
}
