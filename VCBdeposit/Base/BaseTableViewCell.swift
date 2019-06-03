//
//  BaseTableViewCell.swift
//  VCBdeposit
//
//  Created by Lê Toàn on 5/29/19.
//  Copyright © 2019 Lê Toàn. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    
    lazy var contentLabel : UILabel = {
        let view = UILabel()
        
        return view
    }()
    
    lazy var coverButton : UIButton = {
        let view = UIButton()
        
        return view
    }()
    lazy var expandButton : UIButton = {
        let view = UIButton()
        
        return view
    }()
    var completion : ((_ isExpanded: Bool) -> ())?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(contentLabel)
        contentView.addSubview(coverButton)
        contentView.addSubview(expandButton)
        contentView.bringSubviewToFront(coverButton)
        setUpContentLabel()
        setUpCoverButton()
        setUpExpandButton()
        
    }
    
    func setUpCoverButton() {
        
        coverButton.backgroundColor = .clear
//        coverButton.addTarget(self, action: #selector(popup), for: .touchDown)
        
        coverButton.translatesAutoresizingMaskIntoConstraints = false
        coverButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        coverButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        coverButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        coverButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        
    }
    
//    @objc func popup(_ sender: UIButton) {
//        print("Popup")
////        if coverButton.isSelected {
//
////        print(sender.tag)
//            completion?(true)
////        }
////        else {
////            completion?(false)
////        }
////        coverButton.isSelected = !coverButton.isSelected
//    }
    
    func setUpContentLabel() {
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        contentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        
    }
    func setUpExpandButton() {
        
        expandButton.setImage(#imageLiteral(resourceName: "icons8-expand2"), for: .normal)
        expandButton.tintColor = .black
        expandButton.setTitle(nil, for: .normal)
        expandButton.translatesAutoresizingMaskIntoConstraints = false
        expandButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        expandButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        
        // Width & Height
       
        expandButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
    }
    

}
