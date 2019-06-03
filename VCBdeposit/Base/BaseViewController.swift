//
//  BaseViewController.swift
//  VCBdeposit
//
//  Created by Lê Toàn on 5/29/19.
//  Copyright © 2019 Lê Toàn. All rights reserved.
//

import UIKit

//typealias closure =

struct Section {
    var notifications: String
    var collapsed: Bool
    
    init(notifications: String) {
        self.notifications = notifications
        self.collapsed = false
        
    }
}


protocol SectionHeaderViewDelegate: class {
    func sectionHeaderView(sectionHeaderView: UIView, sectionOpened: Int) 
    func sectionHeaderView(sectionHeaderView: UIView, sectionClosed: Int)
}

protocol SectionFooterViewDelegate: class {
    func sectionFooterView(sectionHeaderView: UIView, sectionOpened: Int)
    func sectionFooterView(sectionHeaderView: UIView, sectionClosed: Int)
}

class BaseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    lazy var tableView: UITableView = {
        let view = UITableView.init(frame: CGRect.zero, style: .grouped)
        
        return view
    }()
    
    lazy var headerSection : UIView = {
        let view = UIView()
        view.backgroundColor = .brown
        //
        return view
    }()
    var insideLabel = UILabel()
    
    var footerSection : UIView {
        let view = UIView()
        view.backgroundColor = .gray
        view.addSubview(insideLabel)
        
        insideLabel.translatesAutoresizingMaskIntoConstraints = false
        //        insideLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        //        insideLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        insideLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        insideLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        
        //
        //        insideLabel.text = "testing"
        insideLabel.textColor = .red
        return view
    }
    
    var notifications : [String] = []
    var informations : [String] = []
    var tempChecked = false
    var temp : Array<Int> = []
    //    {
    //        didSet {
    //            temp = temp.removeDuplicates()
    ////            temp = res
    //        }
    //    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        temp.forEach { (text) in
        //            notifications[]
        //        }
        //        for i in 0..<temp.count {
        //            notifications[i].notifications = temp[i]
        //        }
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .blue
        setUpTableView()
        registerCell()
    }
    
    func registerCell() {
        tableView.register(BaseTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(BaseSectionHeaderView.self, forCellReuseIdentifier: "header")
    }
    
    func setUpTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        
        tableView.rowHeight = 90
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return informations.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BaseTableViewCell

        cell.contentLabel.text = informations[indexPath.section]
        cell.coverButton.tag = indexPath.section
        cell.coverButton.addTarget(self, action: #selector(toggleExpanded(_:)), for: .touchDown)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headerSection
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        //        var footerSections = UIView()
        ////
        //        footerSections = footerSection
        
        let header = tableView.dequeueReusableCell(withIdentifier: "header") as! BaseSectionHeaderView
        
        header.titleLaber.text = notifications[section]
        
        
        
        return header.contentView
    }
    //
    //    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
    //        <#code#>
    //    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNonzeroMagnitude
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        for i in temp {
            if section == i {
                return 20
            }
        }
        return CGFloat.leastNonzeroMagnitude
    }
    
    
    // MARK: - PopUp FUNCTION
    
    
    func showPopUp() {

        
    }
    

    @objc func toggleExpanded(_ sender: UIButton) {
        
        //        print(sender.tag)
        //        if header.
        
        //
        //            if sender.tag == section {
//        showPopUp()
//        let popUpView = FirstPopUp()
//        popUpView.modalPresentationStyle = .popover
////        popUpView.modalTransitionStyle = .flipHorizontal
//        let popOver = popUpView.presentedViewController as! UIPopoverPresentationController
//
//        popOver.sourceView = popUpView.view
//        popOver.sourceRect = popUpView.view.bounds
//        popOver.permittedArrowDirections = [.down, .up ]
//
//        self.present(popUpView, animated: true, completion: nil)
        
        
        let popoverController = UIViewController()
        popoverController.view.backgroundColor = .red
        popoverController.view.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        let textLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        textLabel.text = "Hello World"
        textLabel.backgroundColor = .green
        popoverController.view.addSubview(textLabel)
        
        popoverController.modalPresentationStyle = UIModalPresentationStyle.popover
        popoverController.preferredContentSize = CGSize(width: 200, height: 200)
        
        if let popoverPresentation = popoverController.popoverPresentationController {
            popoverPresentation.delegate = self as? UIPopoverPresentationControllerDelegate
            popoverPresentation.sourceRect = CGRect(x: self.view.frame.midX, y: self.view.frame.midY, width: 0, height: 0)
            popoverPresentation.popoverLayoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 210, right: 210)
            popoverPresentation.backgroundColor = .blue
            self.present(popoverController, animated: true, completion: {
                print("pop over is visible")
            })
        }
        
        tempChecked = !tempChecked
        if tempChecked{
            temp.append(sender.tag)
            //            tableView.footerView(forSection: sender.tag)?.heightAnchor.constraint(equalToConstant: 20).isActive = true
            //            tableView.sectionFooterHeight = 20
        } else {
            if !temp.isEmpty {
                temp.removeLast()
            }
            //            tableView.footerView(forSection: sender.tag)?.heightAnchor.constraint(equalToConstant: 0).isActive = true
            //            tableView.sectionFooterHeight = CGFloat.leastNonzeroMagnitude
            print(sender.isSelected)
        }
        
        
        print(temp)
        self.tableView.reloadSections(NSIndexSet(index: sender.tag) as IndexSet, with: .automatic)
        
        
        
    }
    

    
    
}
