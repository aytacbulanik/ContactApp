//
//  PlistManager.swift
//  ContactApp
//
//  Created by AYTAÇ BULANIK on 13.10.2022.
//

import Foundation

enum PlistError : Error {
    case invalidResource
    case notParse
}


struct PlistManager {
    static func array(fileName : String , extention_ : String) throws -> [[String : String]]{
        guard let path = Bundle.main.path(forResource: fileName, ofType: extention_) else {
            throw PlistError.invalidResource }
        
        guard let data = NSArray(contentsOfFile: path) as? [[String : String]] else {
            throw PlistError.notParse
        }
        return data
    }
}
