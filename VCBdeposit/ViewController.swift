//
//  ViewController.swift
//  VCBdeposit
//
//  Created by Lê Toàn on 5/29/19.
//  Copyright © 2019 Lê Toàn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let items = ["Tinh lai tiet kiem","Tinh lich tra no"]
    
    var segmentedControl = UISegmentedControl(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSegmentControl()
        view.backgroundColor = .gray
    }
    
    func setupSegmentControl() {
        
        segmentedControl = UISegmentedControl(items: items)
//        segmentedControl.center = self.view.center
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(indexChanged(_:)), for: .valueChanged)
        
        segmentedControl.layer.cornerRadius = 5.0
        segmentedControl.backgroundColor = .green
        segmentedControl.tintColor = .white
        let font = UIFont.systemFont(ofSize: 18)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font : font], for: .normal)
        
        self.view.addSubview(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false

        segmentedControl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 17).isActive = true
        segmentedControl.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -17).isActive = true
        segmentedControl.heightAnchor.constraint(equalToConstant: 40).isActive = true
        segmentedControl.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        
//        self.view.layoutSubviews()
        
        if segmentedControl.selectedSegmentIndex == 0 {
            remove(asChildViewController: secondViewController)
            add(asChildViewController: firstViewController)
        } else {
            remove(asChildViewController: firstViewController)
            add(asChildViewController: secondViewController)
        }
    }
    
    @objc func indexChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            print("Tinh lai tiet kiem")
            remove(asChildViewController: secondViewController)
            add(asChildViewController: firstViewController)
        case 1:
            print("Tinh lich tra no")
            remove(asChildViewController: firstViewController)
            add(asChildViewController: secondViewController)
        default:
            break
        }
    }
    
    // Setup 2 viewcontrollers
    private lazy var firstViewController: FirstViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = FirstViewController()
        
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    private lazy var secondViewController: SecondViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = SecondViewController()
        
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    func selectionDidChange(_ sender: UISegmentedControl) {
        
    }
    
    private func add(asChildViewController viewController: UIViewController) {
        // Add Child View Controller
        addChild(viewController)
        
        // Add Child View as Subview
        view.addSubview(viewController.view)
        
        // Configure Child View
        viewController.view.translatesAutoresizingMaskIntoConstraints = false
        viewController.view.topAnchor.constraint(equalTo: self.segmentedControl.bottomAnchor, constant: 17).isActive = true
        viewController.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        viewController.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        viewController.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        
  
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Notify Child View Controller
        viewController.didMove(toParent: self)
    }

    private func remove(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParent: nil)
        
        // Remove Child View From Superview
        viewController.view.removeFromSuperview()
        
        // Notify Child View Controller
        viewController.removeFromParent()
        
       

    }
    
    
    
    
}

