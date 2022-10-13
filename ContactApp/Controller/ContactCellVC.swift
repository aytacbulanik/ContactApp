//
//  ContactCellVC.swift
//  ContactApp
//
//  Created by AYTAÇ BULANIK on 14.10.2022.
//

import UIKit

class ContactCellVC: UITableViewCell {

    @IBOutlet var avatarImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var detailNameLabel: UILabel!
    @IBOutlet var favoriteİmage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
