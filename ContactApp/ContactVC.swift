//
//  ContactVC.swift
//  ContactApp
//
//  Created by AYTAÇ BULANIK on 13.10.2022.
//

import UIKit

class ContactVC: UITableViewController {
    
    var contactArray : [Contact] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        contactArray = ContactManager.contacts
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        cell.textLabel?.text = contactArray[indexPath.row].firstName
        return cell
    }

   
}
