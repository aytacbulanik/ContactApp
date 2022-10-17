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
    
    static var firstLetterSet : [String] {
        var letter : [String] = [String]()
        for eleman in contacts {
            letter.append(eleman.firstNameStr)
        }
        return letter
    }
    }
