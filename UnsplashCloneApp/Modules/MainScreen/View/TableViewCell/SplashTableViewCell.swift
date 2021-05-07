//
//  SplashTableViewCell.swift
//  OperationQExample
//
//  Created by Yoonha Kim on 5/4/21.
//

import UIKit

class SplashTableViewCell: UITableViewCell, CellReusable {
    
    @IBOutlet private weak var providerLabel: UILabel!
    @IBOutlet private weak var mainImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(configurator: SplashCellViewModelProtocol) {
        providerLabel.text = configurator.provider
        mainImageView.sd_setImage(with: configurator.mainImage)
    }
}
