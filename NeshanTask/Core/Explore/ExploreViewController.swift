//
//  ExploreViewController.swift
//  NeshanTask
//
//  Created by Arman Zohourian on 1/22/24.
//

import UIKit
import MapKit
import CoreLocation

class ExploreViewController: UIViewController, CLLocationManagerDelegate {
    
    let mapView : MKMapView = {
        let map = MKMapView()
        map.overrideUserInterfaceStyle = .dark
        return map
    }()
    private lazy var bottomSheet : BottomSheetView = {
        
        let sheetView = BottomSheetView {[weak self] in
            self?.saveTrip()
        }
        
        return sheetView
    }()
    var contentStackView : UIStackView = {
    
       var stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        return stackView
        
    }()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        self.view.backgroundColor = .blue
        setupViewHierarchy()
        setupViewAttributes()
        setupLayout()
        retrieveLocation()
    }
}

private extension ExploreViewController {
    
    func setupViewHierarchy(){
        self.view.addSubview(mapView)
        self.view.addSubview(bottomSheet)
      }
      
    func setupViewAttributes(){
        bottomSheet.translatesAutoresizingMaskIntoConstraints = false
        mapView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let gestureRecognizer = UIPanGestureRecognizer(target: self, action:
        #selector(handlePanGesture))
        
        gestureRecognizer.cancelsTouchesInView = false
        bottomSheet.addGestureRecognizer(gestureRecognizer)
      }
      
    func setupLayout(){
        NSLayoutConstraint.activate([
        bottomSheet.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        bottomSheet.topAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -400),
        bottomSheet.widthAnchor.constraint(equalToConstant: self.view.frame.width),
        bottomSheet.heightAnchor.constraint(equalToConstant: 900),
        
        mapView.topAnchor.constraint(equalTo: self.view.topAnchor),
        mapView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
        mapView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        mapView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
    
    func saveTrip() {
        let vc = ContactViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    func retrieveLocation() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    
    }
    
    @objc func handlePanGesture(gesture: UIPanGestureRecognizer) {
        if gesture.state == .began {
            print("Began")
        } else if gesture.state == .changed {
            let translation = gesture.translation(in: self.view)
            if((self.view.frame.height - bottomSheet.center.y > 250 && translation.y < 0) || (self.view.frame.height - bottomSheet.center.y < 0 && translation.y > 0)){
                print("Block")
            }else{
                gesture.view!.center = CGPoint(x: gesture.view!.center.x, y: gesture.view!.center.y + translation.y)
                gesture.setTranslation(CGPoint.zero, in: self.view)
            }
            if(self.view.frame.height - bottomSheet.center.y > 250){
                bottomSheet.center.y = self.view.frame.height - 250
            }
            if(self.view.frame.height - bottomSheet.center.y < 0){
                bottomSheet.center.y = self.view.frame.height
            }
        } else if gesture.state == .ended {
            gesture.view?.center = CGPoint(x: self.bottomSheet.center.x,
            y: self.bottomSheet.center.y)
            
            print("ended")
            UIView.animate(withDuration: 0.5, animations: {
                if(self.view.frame.height -  self.bottomSheet.center.y < 60){
                    self.bottomSheet.center.y = self.view.frame.height
                }else{
                    self.bottomSheet.center.y = self.view.frame.height - 150
                }
            })
            print("Ended")
        }
    }
}
