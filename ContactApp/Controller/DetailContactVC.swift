//
//  DetailContactVC.swift
//  ContactApp
//
//  Created by AYTAÇ BULANIK on 13.10.2022.
//

import UIKit

class DetailContactVC: UIViewController, UITableViewDelegate , UITableViewDataSource {
   
    
    
    var contact : Contact? {
        didSet {
            print(contact?.firstName)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }

}
