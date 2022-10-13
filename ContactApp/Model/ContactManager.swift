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
       return [Contact]()
       }
    }
