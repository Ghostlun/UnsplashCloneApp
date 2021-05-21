//
//  MainTableHeaderCell.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/21/21.
//

import UIKit

class MainTableHeaderCell: UITableViewHeaderFooterView, CellReusable {
    
    @IBOutlet private weak var mainImageView: UIImageView!

    func configure(configurator: SplashCellViewModelProtocol) {
        mainImageView.sd_setImage(with: configurator.mainImage)
    }
}
