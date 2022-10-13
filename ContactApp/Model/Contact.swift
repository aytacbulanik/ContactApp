//
//  Contact.swift
//  ContactApp
//
//  Created by AYTAÇ BULANIK on 13.10.2022.
//

import Foundation
import UIKit

struct Contact {
    let firstName : String
    let lastName : String
    let phoneNumber : String
    let email : String
    let streetAddress : String
    let city : String
    let state : String
    let zip : String
    let avatarName : String
    let image : UIImage?
    let favorite : Bool
}

extension Contact {
    struct Key {
        static let firstNameKey = "firstName"
        static let lastNameKey = "lastName"
        static let phoneNumberKey = "phoneNumber"
        static let emailKey = "email"
        static let streetAddressKey = "streetAddress"
        static let cityKey = "city"
        static let stateKey = "state"
        static let zipKey = "zip"
        static let avatarNameKey = "avatarName"
    }
    
    init? (data : [String:String]) {
        guard let firstNamedata = data[Key.firstNameKey] ,
              let lastNamedata = data[Key.lastNameKey] ,
              let phoneNumberData = data[Key.phoneNumberKey] ,
              let emailData = data[Key.emailKey] ,
              let streetData = data[Key.stateKey] ,
              let cityData = data[Key.cityKey] ,
              let stateData = data[Key.stateKey] ,
              let zipData = data[Key.zipKey] ,
              let avatarNameData = data[Key.avatarNameKey] else {return nil}
        
            firstName = firstNamedata
            lastName = lastNamedata
            phoneNumber = phoneNumberData
            email = emailData
            streetAddress = streetData
            city = cityData
            state = stateData
            zip = zipData
            avatarName = avatarNameData
    }
    
}
