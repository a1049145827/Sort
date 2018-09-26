//
//  Student.swift
//  Sort
//
//  Created by geekbruce on 2018/9/26.
//  Copyright © 2018 qianbao. All rights reserved.
//

import Foundation

struct Student: Comparable {
    
    var name: String
    var score: Int8
    
    init(name: String, score: Int8) {
        self.name = name
        self.score = score
    }
    
    
    // MARK: - Comparable
    static func < (lhs: Student, rhs: Student) -> Bool {
        if lhs.score != rhs.score {
            return lhs.score < rhs.score
        }
        return lhs.name < rhs.name
    }
    
}
