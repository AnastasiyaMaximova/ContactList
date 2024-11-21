//
//  Persons.swift
//  ContactList
//
//  Created by Anastasya Maximova on 21.11.2024.
//

import Foundation

struct Person {
    let name: String
    let surname: String
    let phone: String
    let email: String
    var fullName: String {
        "\(name) \(surname)"
    }
    static func getPersonList() -> [Person]{
        let dataStore = DataStore()
        var personList = [Person]()
        for _ in dataStore.names {
            personList.append(Person(name: dataStore.names.randomElement() ?? "",
                                     surname: dataStore.surnames.randomElement() ?? "",
                                     phone: dataStore.phons.randomElement() ?? "",
                                     email: dataStore.emails.randomElement() ?? ""
                                    )
                              )
        }
        return personList
    }
}
