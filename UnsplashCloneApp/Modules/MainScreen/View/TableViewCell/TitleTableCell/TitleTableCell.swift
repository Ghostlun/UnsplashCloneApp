//
//  TitleTableCell.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/12/21.
//

import UIKit

class TitleTableCell: UITableViewCell, CellReusable {

    @IBOutlet private weak var mainImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(configurator: SplashCellViewModelProtocol) {
        mainImageView.sd_setImage(with: configurator.mainImage)
    }
}
