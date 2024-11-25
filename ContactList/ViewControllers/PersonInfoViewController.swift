//
//  PersonInfoViewController.swift
//  ContactList
//
//  Created by Anastasya Maximova on 24.11.2024.
//

import UIKit

final class PersonInfoViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var person: Person!

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = person.fullName
        phoneLabel.text = "Phone: \(person.phone)"
        emailLabel.text = "E-mail: \(person.email)"
    }
}
