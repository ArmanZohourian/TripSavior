//
//  ExploreViewModel.swift
//  NeshanTask
//
//  Created by Arman Zohourian on 1/24/24.
//

import Foundation

protocol ExploreViewModelDelegate: AnyObject {
    func didFinish()
    func didFail(error: Error)
}

@MainActor
class ExploreViewModel {
    
    private var requestManager = RequestManager.shared
    private(set) var locationDetails : LocationDetails?
    weak var delegate: ExploreViewModelDelegate?
    
    func getLocationDetails(with latitude: Double, longtitude: Double) {
        Task {
            do {
                let result: LocationDetails = try await requestManager.perform(GetLocationDetails.getLocationDetailsWith(selectedLatitude: latitude, selectedLongtitude: longtitude))
                self.locationDetails = result
                self.delegate?.didFinish()
                
            } catch {
                print("Error occured")
                self.delegate?.didFail(error: error)
            }
        }
    }
    
    
}
