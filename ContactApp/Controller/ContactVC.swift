//
//  ContactVC.swift
//  ContactApp
//
//  Created by AYTAÇ BULANIK on 13.10.2022.
//

import UIKit

class ContactVC: UITableViewController {
    
    var contactArray : [Contact] = []
    var uniqueLetter : [String] = []
    var sendContact : Contact?
    override func viewDidLoad() {
        super.viewDidLoad()
        contactArray = ContactManager.contacts.sorted{$0.firstName < $1.firstName}
        uniqueLetter = ContactManager.uniqueFirstLetter
    
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contactArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! ContactCellVC
        let contactObject = contactArray[indexPath.row]
        cell.avatarImage.image = UIImage(named: contactObject.avatarName)
        cell.nameLabel.text = "\(contactObject.firstName) \(contactObject.lastName)"
        cell.detailNameLabel.text = "\(contactObject.streetAddress)"
        cell.favoriteİmage.image = UIImage(systemName: "star.fill")
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sendContact = contactArray[indexPath.row]
        performSegue(withIdentifier: "detailSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            let baglanti = segue.destination as! DetailVC
            baglanti.contact = sendContact
        }
    }
    
   
}

extension ContactVC : TakeFavoriteProtokolDelegate {
    func makeFavorite(contact: Contact) {
        print(contact.firstName)
    }
    
    
}

