//
//  DetailVC.swift
//  ContactApp
//
//  Created by AYTAÇ BULANIK on 16.10.2022.
//

import UIKit

protocol TakeFavoriteProtokolDelegate {
    func makeFavorite(contact : Contact)
}

class DetailVC: UITableViewController  {
    
    
    @IBOutlet var personImage : UIImageView!
    @IBOutlet var personNameLabel : UILabel!
    @IBOutlet var phoneNumberLabel : UILabel!
    @IBOutlet var mailLabel : UILabel!
    @IBOutlet var addressLabel : UILabel!
    @IBOutlet var favoriteButton : UIButton!
    
    var contact : Contact?
    var delegate : TakeFavoriteProtokolDelegate?
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
        if contact.favorite {
            favoriteButton.setTitle("dont gate Favorite", for: .normal)
        } else {
            favoriteButton.setTitle("Take a an Favorite", for: .normal)
        }
        addressLabel.text = """
            \(contact.streetAddress)
            \(contact.zip)
            \(contact.city) / \(contact.state)
        """
    }
    
    @IBAction func  pressedFavoriteButton(_ sender : UIButton) {
        
        guard let contact else {return}
        self.contact?.favorite = !contact.favorite
        if (self.contact?.favorite)! {
            favoriteButton.setTitle("Remove From Favorites", for: UIControl.State.normal)
        } else {
            favoriteButton.setTitle("Mark As Favorite Contact", for: UIControl.State.normal)
        }
        delegate?.makeFavorite(contact: contact)
    }

   
}
