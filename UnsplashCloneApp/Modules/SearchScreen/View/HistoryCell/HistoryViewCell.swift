//
//  HistoryViewCell.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/25/21.
//

import UIKit

class HistoryViewCell: UITableViewCell, CellReusable {
    
    @IBOutlet private weak var historyLabel: UILabel!

    func configure(history: String) {
        historyLabel.text = history
    }
}
