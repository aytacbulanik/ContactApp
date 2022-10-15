//
//  DetailContactVC.swift
//  ContactApp
//
//  Created by AYTAÇ BULANIK on 13.10.2022.
//

import UIKit

class DetailContactVC: UIViewController {
    
    var contact : Contact? {
        didSet {
            print(contact?.firstName)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

}
