//
//  AddContactCollectionViewCell.swift
//  NeshanTask
//
//  Created by Arman Zohourian on 1/27/24.
//

import UIKit

class AddContactCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "AddContactCell"
    var addButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false 
        button.setTitle("+", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 20
        return button
    }()
    var tapCallback: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupButtonLayout()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupViews() {
        addSubview(addButton)
    }
    
    private func setupButtonLayout() {
        self.isUserInteractionEnabled = true 
        NSLayoutConstraint.activate([
            addButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            addButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            addButton.heightAnchor.constraint(equalToConstant: 40),
            addButton.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.addGestureRecognizer(tapGesture)
    }

    @objc private func handleTap() {
        tapCallback?()
    }
}
