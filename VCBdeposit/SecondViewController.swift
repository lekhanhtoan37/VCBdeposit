//
//  SecondViewController.swift
//  VCBdeposit
//
//  Created by Lê Toàn on 5/29/19.
//  Copyright © 2019 Lê Toàn. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        super.init(nibName: "SecondViewController", bundle: nil)
//
//    }
    
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        // Do any additional setup after loading the view.
    }
    deinit {
        print("case 2")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
