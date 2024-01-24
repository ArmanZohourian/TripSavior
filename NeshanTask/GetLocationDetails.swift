//
//  GetLocationDetails.swift
//  NeshanTask
//
//  Created by Arman Zohourian on 1/24/24.
//

import Foundation
enum GetLocationDetails: RequestProtocol {

    case getLocationDetailsWith(selectedLatitude: Double, selectedLongtitude: Double)
    
    var path: String {
        "/v1/search"
    }
    
    var reuqestType: RequestType {
        .POST
    }
    
    var addAuthorizationToken: Bool {
        return false
    }
    
    var params: [String : Any] {
        
        var params : [String: Any] = [:]
        
        switch self {
        case let .getLocationDetailsWith(selectedLatitude, selectedLongtitude):
            params = ["lat" : selectedLatitude, "long" : selectedLongtitude]
        }
        return params
    }
}
