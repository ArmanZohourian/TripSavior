//
//  TripsViewController.swift
//  NeshanTask
//
//  Created by Arman Zohourian on 1/22/24.
//

import UIKit

class TripsViewController: UIViewController {
    
    var viewModel: TripsViewModel = TripsViewModel()
        
    var tripsTableView: UITableView = {
        var tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Saved Trips"
        setupTableView()
        view.addSubview(tripsTableView)
        setupViews()
        viewModel.fetchTrips()
        
    }
}

extension TripsViewController {
    
    private func setupViews() {
        NSLayoutConstraint.activate([
        tripsTableView.topAnchor.constraint(equalTo: view.topAnchor),
        tripsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        tripsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        tripsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
    }
    
    private func setupTableView() {
        tripsTableView.register(TripTableViewCell.self, forCellReuseIdentifier: TripTableViewCell.identifier)
        tripsTableView.dataSource = self
        tripsTableView.delegate = self
    }
    
}

extension TripsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.trips.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tripsTableView.dequeueReusableCell(withIdentifier: TripTableViewCell.identifier, for: indexPath) as! TripTableViewCell
        let trip = viewModel.trips[indexPath.row]
        cell.setValues(with: trip)
        return cell
    }
    
    
}

extension TripsViewController: TripViewModelDelegate {
    func didFetchTrips() {
        self.tripsTableView.reloadData()
    }
    
    func didFailedFetchingTrips() {
        
    }
    
    
}

