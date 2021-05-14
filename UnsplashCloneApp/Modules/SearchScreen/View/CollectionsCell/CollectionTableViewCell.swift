//
//  CollectionTableViewCell.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/13/21.
//

import UIKit

class CollectionTableViewCell: UITableViewCell, CellReusable {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var mainImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(data: CollectionTableCellViewModelProtocol) {
        self.titleLabel.text = data.imageTitle
        self.mainImageView.sd_setImage(with: data.imageUrl, completed: nil)
    }
}
