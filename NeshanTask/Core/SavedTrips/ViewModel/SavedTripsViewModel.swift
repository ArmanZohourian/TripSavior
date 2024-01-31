//
//  TripsViewModel.swift
//  NeshanTask
//
//  Created by Arman Zohourian on 1/30/24.
//

import Foundation
import CoreData

protocol TripViewModelDelegate: AnyObject {
    func didFetchTrips()
    func didFailedFetchingTrips()
}

class SavedTripsViewModel {
    
    weak var delegate : TripViewModelDelegate?
    
    var trips: [TripEntity] = [] 
    let tripDataService = TripDataService.shared
    
    func fetchTrips() {
        trips = tripDataService.fetchTrips()
        self.delegate?.didFetchTrips()
    }
    
    
}
