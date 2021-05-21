//
//  StretcyHeaderView.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/21/21.
//

import UIKit

class StretcyHeaderView: UIView {
    
    let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private var imageViewHeight = NSLayoutConstraint()
    private var imageViewBottom = NSLayoutConstraint()
    private var containerView = UIView()
    private var containerViewHeight = NSLayoutConstraint()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createView()
        setViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func createView() {
        addSubview(containerView)
        containerView.addSubview(myImageView)
    }
    
    func setViewConstraints() {
        NSLayoutConstraint.activate([
                                        widthAnchor.constraint(equalTo: containerView.widthAnchor),
                                        centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
                                        heightAnchor.constraint(equalTo: containerView.heightAnchor)])
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.widthAnchor.constraint(equalTo: myImageView.widthAnchor).isActive = true
        containerViewHeight = containerView.heightAnchor.constraint(equalTo: self.heightAnchor)
        containerViewHeight.isActive = true
        
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        imageViewHeight = myImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        imageViewHeight.isActive = true
        imageViewBottom = myImageView.heightAnchor.constraint(equalTo: containerView.heightAnchor)
        imageViewHeight.isActive = true
    }
    
    
    public func scrollViewDidScroll(scrollView: UIScrollView) {
        containerViewHeight.constant = scrollView.contentInset.top
        let offsetY = -(scrollView.contentOffset.y + scrollView.contentInset.top)
        containerView.clipsToBounds = offsetY <= 0
        imageViewBottom.constant = offsetY >= 0 ? 0 : -offsetY / 2
        imageViewHeight.constant = max(offsetY + scrollView.contentInset.top, scrollView.contentInset.top)
    }
}
