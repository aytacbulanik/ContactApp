//
//  ContactManager.swift
//  ContactApp
//
//  Created by AYTAÇ BULANIK on 13.10.2022.
//

import Foundation

struct ContactManager {
    
   static var contacts : [Contact] {
        let data = try! PlistManager.array(fileName: "ContactsDB", extention_: "plist")
       return data.compactMap { Contact(data: $0)}
       }
    
    static var uniqueFirstLetter : [String] {
        let firstLetters = contacts.map {$0.firstNameStr}
        let firstLetterSet = Set(firstLetters)
        return Array(firstLetterSet).sorted()
    }
    

      static var sectinedContacts : [[Contact]] {
        return ContactManager.uniqueFirstLetter.map { firstletter in
        let filteredContacts = ContactManager.contacts.filter { $0.firstNameStr == firstletter }
        return filteredContacts.sorted(by: {$0.firstName < $1.firstName})
            }
        }

    
    }
