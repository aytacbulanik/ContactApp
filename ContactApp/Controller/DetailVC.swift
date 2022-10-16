//
//  DetailVC.swift
//  ContactApp
//
//  Created by AYTAÇ BULANIK on 16.10.2022.
//

import UIKit

class DetailVC: UITableViewController {
    @IBOutlet var personImage : UIImageView!
    @IBOutlet var personNameLabel : UILabel!
    @IBOutlet var phoneNumberLabel : UILabel!
    @IBOutlet var mailLabel : UILabel!
    @IBOutlet var addressLabel : UILabel!
    
        var contact : Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailContact(object: contact)
        
    }

    func detailContact(object contact : Contact?) {
        guard let contact else {return}
        personImage.image = UIImage(named: contact.avatarName)
        personNameLabel.text = "\(contact.firstName) \(contact.lastName.uppercased())"
        phoneNumberLabel.text = contact.phoneNumber
        mailLabel.text = contact.email
        addressLabel.text = """
            \(contact.streetAddress)
            \(contact.zip)
            \(contact.city) / \(contact.state)
        """
    }

   
}
