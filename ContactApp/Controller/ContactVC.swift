//
//  ContactVC.swift
//  ContactApp
//
//  Created by AYTAÇ BULANIK on 13.10.2022.
//

import UIKit

class ContactVC: UITableViewController , TakeFavoriteProtokolDelegate {
    
    
    
    var uniqueLetter : [String] = []
    var sectionadContactArray : [[Contact]] = ContactManager.sectinedContacts
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

    // MARK: - Table view data source
    func makeFavorite(contact: Contact) {
        
        var sectionIndex : Int? = nil
        var contactIndex : Int? = nil
        
        
        for (index, contacts) in sectionadContactArray.enumerated() {
            
            if let indexOfContacts = contacts.index(of: contact) {
                
                sectionIndex = index
                contactIndex = indexOfContacts
                break
            }
        }
        
        
        if let sectionIndex = sectionIndex , let contactIndex = contactIndex {
            sectionadContactArray[sectionIndex][contactIndex].favorite = contact.favorite
            tableView.reloadData()
        }
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sectionadContactArray.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sectionadContactArray[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! ContactCellVC
        let contact = sectionadContactArray[indexPath.section][indexPath.row]
        cell.avatarImage.image = UIImage(named: contact.avatarName)
        cell.nameLabel.text = "\(contact.firstName) \(contact.lastName)"
        cell.detailNameLabel.text = "\(contact.streetAddress)"
        if contact.favorite {
            cell.favoriteİmage.image = UIImage(systemName: "star.fill")
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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
        if let indexPath = tableView.indexPathForSelectedRow {
            let selectedcontact = sectionadContactArray[indexPath.section][indexPath.row]
            let baglanti = segue.destination as! DetailVC
            baglanti.delegate = self
            baglanti.contact = selectedcontact
            
        }
        }
    }
    
   
}


