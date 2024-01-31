//
//  TripCellView.swift
//  NeshanTask
//
//  Created by Arman Zohourian on 1/30/24.
//

import Foundation
import UIKit

class TripTableViewCell: UITableViewCell {
    
    static let identifier = "TripCell"
    
    var cityNameLabel: UILabel!
    var stateLabel: UILabel!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupSubviews() {
        cityNameLabel = UILabel()
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        cityNameLabel.textColor = .white
        cityNameLabel.font = UIFont.systemFont(ofSize: 16)
        contentView.addSubview(cityNameLabel)



        stateLabel = UILabel()
        stateLabel.textColor = .white
        stateLabel.textAlignment = .right
        stateLabel.font = UIFont.systemFont(ofSize: 14)
        stateLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stateLabel)

        NSLayoutConstraint.activate([
            cityNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            cityNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            stateLabel.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor, constant: 4),
            stateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    func setValues(with trip: TripEntity) {
        cityNameLabel.text = trip.location?.city ?? "City Name Not Available"
        stateLabel.text = trip.location?.formattedAddress ?? "State Not Available"
    }
}
