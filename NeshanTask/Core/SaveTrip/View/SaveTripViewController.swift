//
//  SaveTripViewController.swift
//  NeshanTask
//
//  Created by Arman Zohourian on 1/26/24.
//

import UIKit

class SaveTripViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

private extension SaveTripViewController {
    func setupViews() {
       
        setupCollectionView()
        setupCollectionViewConstraints()
        view.addSubview(contactCollection)
        
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        contactCollection = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        contactCollection.dataSource = self
        contactCollection.delegate = self
        contactCollection.register(ContactCollectionViewCell.self, forCellWithReuseIdentifier: "contactcell")
        
    }
    
    func setupCollectionViewConstraints() {
        contactCollection.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contactCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            contactCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            contactCollection.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    @objc func saveTrip() {
//        saveTripViewModel.addTrip(with: <#T##CNContact#>, location: <#T##LocationDetails#>)
    }
}

extension SaveTripViewController: SaveTripViewModelDelegate {
    func didFinish() {
        contactCollection.reloadData()
    }
    
    func didFail(error: Error) {
        print(error)
    }
    
}
extension SaveTripViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return saveTripViewModel.contacts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "contactcell", for: indexPath) as! ContactCollectionViewCell
        let contact = saveTripViewModel.contacts[indexPath.row]
        cell.setContact(contact: contact)
        
        return cell
    }
    
    
}
