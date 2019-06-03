//
//  Array.swift
//  VCBdeposit
//
//  Created by Lê Toàn on 5/31/19.
//  Copyright © 2019 Lê Toàn. All rights reserved.
//

import Foundation


extension Array where Element:Equatable {
    func removeDuplicates() -> [Element] {
        var result = [Element]()
        
        for value in self {
            if result.contains(value) == false {
                result.append(value)
            }
        }
        
        return result
    }
}
