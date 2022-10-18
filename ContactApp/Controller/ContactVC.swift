//
//  ContactVC.swift
//  ContactApp
//
//  Created by AYTAÇ BULANIK on 13.10.2022.
//

import UIKit

class ContactVC: UITableViewController {
    
    var uniqueLetter : [String] = []
    var sectionadContactArray : [[Contact]] = ContactManager.sectinedContacts
    var sendContact : Contact?
    override func viewDidLoad() {
        super.viewDidLoad()
   

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sectionadContactArray.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sectionadContactArray[section].count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! ContactCellVC
        let contact = sectionadContactArray[indexPath.section][indexPath.row]
        cell.avatarImage.image = UIImage(named: contact.avatarName)
        cell.nameLabel.text = "\(contact.firstName) \(contact.lastName)"
        cell.detailNameLabel.text = "\(contact.streetAddress)"
        cell.favoriteİmage.image = UIImage(systemName: "star.fill")
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sendContact = sectionadContactArray[indexPath.section][indexPath.row]
        performSegue(withIdentifier: "detailSegue", sender: nil)
        
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ContactManager.uniqueFirstLetter[section]
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return ContactManager.uniqueFirstLetter
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

