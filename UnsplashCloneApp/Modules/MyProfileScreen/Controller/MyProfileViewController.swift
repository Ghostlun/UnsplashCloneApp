//
//  MyProfileController.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/11/21.
//
// test1234@gmail.com
// pwd: 1211asdF
import UIKit

class MyProfileViewController: UIViewController {
    
    @IBOutlet private weak var userLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            self.tableView.dataSource = self
            self.tableView.delegate = self
            self.tableView.register(UINib(nibName: ProfileLikeTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: ProfileLikeTableViewCell.reuseIdentifier)
            self.tableView.register(UINib(nibName: MyUploadedImageViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: MyUploadedImageViewCell.reuseIdentifier)
        }
    }
    
    @IBOutlet private weak var profileSegmentedControl: UISegmentedControl!
    
    lazy var myProfileViewModel = MyProfileViewModel(delegate: self, viewController: self)
    
    var dataSource: [UIImage]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myProfileViewModel.fetchData {}
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        if checkUser() == false {
            self.performSegue(withIdentifier: "showLogin", sender: nil)
        }
    }
    
    func configureData(userData: User) {
        self.userLabel.text = "\(userData.lastName) \(userData.firstName)"
    }
    
    
    @IBAction private func segmentedValueChanged() {
        print("\(profileSegmentedControl.selectedSegmentIndex)")
        self.tableView.reloadData()
    }
}
extension MyProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch profileSegmentedControl.selectedSegmentIndex {
        case 0:
            let data = myProfileViewModel.configuredData(index: indexPath.row)
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MyUploadedImageViewCell.reuseIdentifier, for: indexPath) as? MyUploadedImageViewCell else {
                return UITableViewCell()
            }
            cell.configure(imageUrl: data)
            return cell
            
        case 1:
            let data = myProfileViewModel.configureLikeData(index: indexPath.row)
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileLikeTableViewCell.reuseIdentifier, for: indexPath) as? ProfileLikeTableViewCell else { return UITableViewCell() }
            cell.configure(urlAddress: data)
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        myProfileViewModel.numberOfRows(index: profileSegmentedControl.selectedSegmentIndex)
    }
}

extension MyProfileViewController: MyProfileViewModelDelegate {
    func reloadProfile() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
