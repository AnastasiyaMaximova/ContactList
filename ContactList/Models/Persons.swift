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
            personList.append(Person(name: getRandomElement(from: &dataStore.names),
                                     surname: getRandomElement(from: &dataStore.surnames),
                                     phone: getRandomElement(from: &dataStore.phons),
                                     email: getRandomElement(from: &dataStore.emails)
                                    )
                              )
        }
        return personList
    }
    
  static func getRandomElement(from elements: inout [String]) -> String {
        let randomElement = elements.randomElement() ?? ""
        elements = elements.filter(){$0 != randomElement}
        return randomElement
    }
}
