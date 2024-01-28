//
//  BottomSheetViewController.swift
//  NeshanTask
//
//  Created by Arman Zohourian on 1/22/24.
//

import UIKit

class BottomSheetView: UIView {
    
    
    var locationDetails: LocationDetails? {
        didSet {
            titleText.text = locationDetails?.city ?? "Saint Louis"
            overviewText.text = locationDetails?.neighbourhood ?? "Nothing to show"
        }
    }
    
    private lazy var titleText: UILabel = {
        let label = UILabel()
        label.text = "Saint Louis"
        label.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var overviewLabel: UILabel = {
        let label = UILabel()
        label.text = "Overview"
        label.font = UIFont.systemFont(ofSize: 23)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var overviewText: UILabel = {
        let label = UILabel()
        label.text = "You've already taken the test, and because of your current score, I don't think you'll have a difficult time getting band 8. To achieve the score you're aiming for, there are a few things you should consider. I know, of course, that you're well aware of them already."
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        label.numberOfLines = 10
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var saveButton : UIButton = {
        var buttonConfig : UIButton = UIButton(type: .system)
        buttonConfig.translatesAutoresizingMaskIntoConstraints = false
        buttonConfig.setTitle("Save", for: .normal)
        buttonConfig.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        buttonConfig.backgroundColor = UIColor.blue
        buttonConfig.setTitleColor(UIColor.white, for: .normal)
        buttonConfig.layer.cornerRadius = 15
        buttonConfig.clipsToBounds = true
        buttonConfig.addTarget(self, action: #selector(didTapSave), for: .touchUpInside)

        return buttonConfig
    }()
    
    private lazy var bottomSheetStackView : UIStackView = {
        var stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()
    
    private var buttonAction: () -> ()
    
    init(action: @escaping ()-> ()) {
        self.buttonAction = action
        super.init(frame: .zero)
        setupViewHierarchy()
        setupViewAttributes()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension BottomSheetView {
    
    func setupViewHierarchy(){
        self.addSubview(bottomSheetStackView)
        bottomSheetStackView.addArrangedSubview(titleText)
        bottomSheetStackView.addArrangedSubview(overviewLabel)
        bottomSheetStackView.addArrangedSubview(overviewText)
        bottomSheetStackView.addArrangedSubview(saveButton)
    }
    
    func setupViewAttributes(){
        self.backgroundColor = .black
        self.layer.cornerRadius = 40
    }
    
    func setupLayout(){
        NSLayoutConstraint.activate([
            
            titleText.heightAnchor.constraint(equalToConstant: 25),
            overviewLabel.heightAnchor.constraint(equalToConstant: 20),
            bottomSheetStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            bottomSheetStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            bottomSheetStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            bottomSheetStackView.heightAnchor.constraint(equalToConstant: 300)
    
        ])
    }
    
    @objc func didTapSave(sender: UIButton) {
        buttonAction()
    }
}

