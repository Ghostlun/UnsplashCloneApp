//
//  UsersTableViewCell.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/13/21.
//

import UIKit

class UsersTableViewCell: UITableViewCell, CellReusable {
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var userNameLabel: UILabel!
    @IBOutlet private weak var profileImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImageView.makeRounded()
    }
    
    func configure(_ data: UserTableCellViewModelProtocol) {
        nameLabel.text = data.name
        userNameLabel.text = data.userName
        profileImageView.sd_setImage(with: data.profileImage, completed: nil)
    }
}
