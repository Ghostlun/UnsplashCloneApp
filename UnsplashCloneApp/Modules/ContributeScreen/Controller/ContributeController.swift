//
//  ContributeController.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/11/21.
//

import UIKit

class ContributeController: UIViewController {
    
    @IBOutlet private weak var latestCollectionView: UICollectionView! {
        didSet {
            self.latestCollectionView.delegate = self
            self.latestCollectionView.dataSource = self
        }
    }
    
    lazy var contributeViewModel = ContributeViewModel(delegate: self)
    
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
