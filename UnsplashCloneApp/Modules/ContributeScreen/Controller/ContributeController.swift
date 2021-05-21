//
//  ContributeController.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/11/21.
//

import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore
import UIKit

class ContributeController: UIViewController {
    
    private let storage = Storage.storage().reference()
    private var db = Firestore.firestore()
    
    @IBOutlet private weak var latestCollectionView: UICollectionView! {
        didSet {
            self.latestCollectionView.delegate = self
            self.latestCollectionView.dataSource = self
        }
    }
    
    lazy var contributeViewModel = ContributeViewModel(delegate: self)
    var selectedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contributeViewModel.fetchData()
    }
    
    @IBAction private func imagePick() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    func uploadImage(image: UIImage) {
        let uid = Auth.auth().currentUser?.uid ?? "No data"
        let number = Int.random(in: 0..<100)
        let imageName = "imageName\(number).png"
        let ref = storage.child("\(uid)/\(imageName)")
        
        guard let image = image.pngData() else { return }
        ref.putData(image, metadata: nil, completion: { _, error in
            guard  error == nil else {
                print("Failed upload")
                return
            }
            ref.downloadURL { url, error in
                guard let url = url, error == nil  else {
                    return
                }
                let urlString = url.absoluteString
                print("UrlAddress: \(urlString)")
                self.db.collection("users").document(uid).updateData(["uploadImage": FieldValue.arrayUnion([urlString])])
            }
        })
    }
}
extension ContributeController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        contributeViewModel.numbersOfCollectionViewRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sendData = self.contributeViewModel.photoResult(at: indexPath.row)
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LatestCollectionCellView.reuseIdentifier,
                                                            for: indexPath) as? LatestCollectionCellView else { return UICollectionViewCell() }
        cell.configure(sendData)
        return cell
    }
}

extension ContributeController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let targetImage = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            selectedImage = targetImage
            self.uploadImage(image: targetImage)
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

extension ContributeController: ContributeViewModelDelegate {
    func reloadData() {
        DispatchQueue.main.async {
            self.latestCollectionView.reloadData()
        }
    }
}
extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()
        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }
    
    mutating func removeDuplicates() {
        self = self.removingDuplicates()
    }
}
