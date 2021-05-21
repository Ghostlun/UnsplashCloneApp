//
//  ContributeViewModel.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/11/21.
//

import FirebaseAuth
import FirebaseFirestore
import UIKit

protocol ContributeViewModelDelegate: AnyObject {
    func reloadData()
}

class ContributeViewModel {
    
    var router = Router<LatestCollectionApi>()
    var dataSource: [LatestModel]
    weak var delegate: ContributeViewModelDelegate?
    let db = Firestore.firestore()
    
    init(delegate: ContributeViewModelDelegate) {
        self.delegate = delegate
        dataSource = []
    }
    
    func photoResult(at index: Int) -> CollectionCellViewModelProtocol {
        CollectionCellViewModel(latestModel: dataSource[index])
    }
    
    func numbersOfCollectionViewRows() -> Int {
        dataSource.count
    }
    
    func uploadCellViewModel(image: UIImage) {
        let data = image.pngData()
        let encodedString = data?.base64EncodedString(options: .endLineWithLineFeed) ?? ""
        let uid = Auth.auth().currentUser?.uid ?? "No data"
        self.db.collection("users").document(uid).updateData(["myUploadImage": FieldValue.arrayUnion([encodedString])])
    }
    
    func fetchData() {
        router.request(LatestCollectionApi.collection) { [weak self] (result: Result<LatestModels, AppError>)  in
            switch result {
            case .success(let latestModel):
                self?.dataSource = latestModel
                self?.delegate?.reloadData()
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
