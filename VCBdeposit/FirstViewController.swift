//
//  FirstViewController.swift
//  VCBdeposit
//
//  Created by Lê Toàn on 5/29/19.
//  Copyright © 2019 Lê Toàn. All rights reserved.
//

import UIKit

class FirstViewController: BaseViewController {
    private lazy var subview1: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
//    ["Quy khach vui long chon loai tien","Quy khach vui long nhap so tien goc", "Quy khac vui long chon ky han","Quy khach vui long chon ngay gui"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.tableView.backgroundColor = .white
        super.informations = ["Chon loai tien","Nhap so tien goc","Chon ky han","Chon ngay gui"]
//        let a = ["Quy khach vui long chon loai tien","Quy khach vui long nhap so tien goc", "Quy khac vui long chon ky han","Quy khach vui long chon ngay gui"]
        super.notifications = ["Quy khach vui long chon loai tien","Quy khach vui long nhap so tien goc", "Quy khac vui long chon ky han","Quy khach vui long chon ngay gui"]
        
    }
    
    override func showPopUp() {
//        super.
    }
    

}
