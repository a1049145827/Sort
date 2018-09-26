//
//  Array+Extension.swift
//  Sort
//
//  Created by geekbruce on 2018/9/26.
//  Copyright © 2018 qianbao. All rights reserved.
//

import Foundation

extension Array where Element: Comparable {
    
    // MARK: - 选择排序
    // 复杂度 O((n-1)^2), 发生交换次数较少
    mutating func selectionSort() -> [Element] {
        for i in 0...self.count-2 {
            var min = i
            for j in i + 1...self.count-1 {
                // 先假定d本轮y第一个元素为最小，后面的每个元素依次和最小元素比较，获得真正最小的元素
                if self[j] < self[min] {
                    min = j
                }
            }
            self.swapAt(i, min)
        }
        return self
    }
    
    // MARK: - 冒泡排序
    // 复杂度 O((n-1)^2), 发生交换次数较多
    mutating func bubbleSort() -> [Element] {
        for i in 0...self.count-2 {
            for j in i...self.count-1 {
                if self[j] < self[i] {
                    self.swapAt(i, j)
                }
            }
        }
        return self;
    }
}
