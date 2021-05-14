//
//  UserTableCellViewModel.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/13/21.
//

import Foundation

protocol UserTableCellViewModelProtocol {
    var profileImage: URL { get }
    var name: String { get }
    var userName: String { get }
}

class UserTableCellViewModel: UserTableCellViewModelProtocol {
    
    var profileImage: URL {
        guard let url = URL(string: userResult.profileImage.small) else { fatalError("No Address") }
        return url
    }
    
    var name: String {
        userResult.name
    }
    
    var userName: String {
        userResult.username
    }
    
    let userResult: UserResult
    
    init(userResult: UserResult) {
        self.userResult = userResult
    }
}
