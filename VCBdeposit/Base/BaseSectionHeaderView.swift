//
//  SectionHeaderView.swift
//  VCBdeposit
//
//  Created by Lê Toàn on 5/30/19.
//  Copyright © 2019 Lê Toàn. All rights reserved.
//

import UIKit

class BaseSectionHeaderView: UITableViewCell {

    
    lazy var titleLaber : UILabel = {
        let view = UILabel()
        
        return view
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        

        

    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        
        contentView.addSubview(titleLaber)
        titleLaber.translatesAutoresizingMaskIntoConstraints = false
        titleLaber.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        titleLaber.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        titleLaber.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        titleLaber.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        
        titleLaber.textColor = .red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
