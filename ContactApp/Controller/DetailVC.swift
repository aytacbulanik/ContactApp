//
//  DetailVC.swift
//  ContactApp
//
//  Created by AYTAÇ BULANIK on 16.10.2022.
//

import UIKit

class DetailVC: UITableViewController {
        @IBOutlet var personImage : UIImageView!
        var contact : Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let contact else {return}
        personImage.image = UIImage(named: contact.avatarName)
    }

  

   
}
