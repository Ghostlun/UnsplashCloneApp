//
//  MyUploadedImageViewCell.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/18/21.
//

import UIKit

class MyUploadedImageViewCell: UITableViewCell, CellReusable {
    
    @IBOutlet private weak var myUploadedImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(imageUrl: URL) {
        myUploadedImage.sd_setImage(with: imageUrl, completed: nil )
        
    }
}
