//
//  HistoryHeaderView.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 6/2/21.
//

import UIKit

class HistoryHeaderView: UITableViewHeaderFooterView, CellReusable {
    
    @IBOutlet private weak var historyLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure() {
        historyLabel.text = "History"
    }
}
