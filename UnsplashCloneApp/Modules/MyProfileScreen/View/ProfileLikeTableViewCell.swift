//
//  ProfileCellViewModel.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/17/21.
//

import UIKit

class ProfileLikeTableViewCell: UITableViewCell, CellReusable {
    
    @IBOutlet private weak var likeImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(urlAddress: URL) {
        likeImageView.sd_setImage(with: urlAddress, completed: nil )
    }
}
