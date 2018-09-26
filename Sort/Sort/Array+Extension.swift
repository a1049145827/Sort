//
//  Array+Extension.swift
//  Sort
//
//  Created by geekbruce on 2018/9/26.
//  Copyright © 2018 qianbao. All rights reserved.
//

import Foundation

extension Array where Element: Comparable {
    
    // 选择排序
    mutating func selectionSort() -> [Element] {
        for i in 0...self.count-2 {
            var min = i
            for j in i + 1...self.count-1 {
                if (self[j] < self[min]) {
                    min = j
                }
            }
            self.swapAt(i, min)
        }
        return self
    }
}
