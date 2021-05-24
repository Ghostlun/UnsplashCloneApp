//
//  StretcyHeaderView.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/21/21.
//

import UIKit

class StretchingHeaderView: UIView, CellReusable {
    
    var imageViewHeight = NSLayoutConstraint()
    var imageViewBottom = NSLayoutConstraint()
    var containerView: UIView!
    var imageView: UIImageView!
    var textLabel: UILabel!
    var containerViewHeight = NSLayoutConstraint()

    override init(frame: CGRect) {
        super.init(frame: frame)
        createViews()
        setViewConstraints()
        setLabelSubView()
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func createViews() {
        // Container View
        containerView = UIView()
        self.addSubview(containerView)
        // ImageView for background
        imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        containerView.addSubview(imageView)
      
    }
    
    func setLabelSubView() {
        let frame = CGRect(x: 0, y: self.containerView.frame.midY, width: self.frame.width, height: self.frame.height)
        
        let titleLabel = UILabel(frame: frame)
        titleLabel.text = "Photos for everyone"
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 25.0)
        self.addSubview(titleLabel)
        
        let frame1 = CGRect(x: 0, y: 50, width:  self.frame.width, height:  self.frame.height)
        let subtitleLabel = UILabel(frame: frame1)
        subtitleLabel.text = "Photos of Day by Pawel Czerwinski"
        subtitleLabel.textAlignment = .center
        subtitleLabel.textColor = .white
        subtitleLabel.font = UIFont.boldSystemFont(ofSize: 12.0)
        self.addSubview(subtitleLabel)
    }
    
    
    
    func setViewConstraints() {
        // UIView Constraints
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalTo: containerView.widthAnchor),
            self.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            self.heightAnchor.constraint(equalTo: containerView.heightAnchor)
        ])
        
        // Container View Constraints
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.widthAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
        containerViewHeight = containerView.heightAnchor.constraint(equalTo: self.heightAnchor)
        containerViewHeight.isActive = true
        
        // ImageView Constraints
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageViewBottom = imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        imageViewBottom.isActive = true
        imageViewHeight = imageView.heightAnchor.constraint(equalTo: containerView.heightAnchor)
        imageViewHeight.isActive = true
    }
    
    func whenScrollDid(scrollView: UIScrollView) {
        containerViewHeight.constant = scrollView.contentInset.top
        let offsetY = -(scrollView.contentOffset.y + scrollView.contentInset.top)
        containerView.clipsToBounds = offsetY <= 0
        imageViewBottom.constant = offsetY >= 0 ? 0 : -offsetY / 2
        imageViewHeight.constant = max(offsetY + scrollView.contentInset.top, scrollView.contentInset.top)
    }
}
