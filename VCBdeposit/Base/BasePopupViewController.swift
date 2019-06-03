//
//  BasePopupViewController.swift
//  VCBdeposit
//
//  Created by Lê Toàn on 6/1/19.
//  Copyright © 2019 Lê Toàn. All rights reserved.
//

import UIKit

class BasePopupViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPopoverPresentationControllerDelegate {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var items = [String]()
    lazy var tableView : UITableView = {
        let view = UITableView()
        
        
        return view
    }()
    
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(BasePopUpCell.self, forCellReuseIdentifier: "cell")
        self.navigationItem.title = "abc"
        tableView.backgroundColor = .blue
        setUpTableView()
        
    }
    func setUpTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -100).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 100).isActive = true
        
        tableView.rowHeight = 30
    }
    
    
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .popover
    }
    
    func presentationController(_ controller: UIPresentationController, viewControllerForAdaptivePresentationStyle style: UIModalPresentationStyle) -> UIViewController? {
        let navigationController = UINavigationController(rootViewController: controller.presentedViewController)
        let btnDone = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(dismiss(_:)))
        navigationController.topViewController?.navigationItem.rightBarButtonItem = btnDone
        
        return navigationController
    }
    
    @objc func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BasePopUpCell
        
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
//            if let segue = 
        }
    }
    
    
}

class BasePopUpCell: UITableViewCell  {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
