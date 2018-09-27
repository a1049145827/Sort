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
    // 复杂度 O(n^2), swap函数时间复杂度 O(n)
    mutating func selectionSort() -> [Element] {
        if self.count < 2 {
            return self
        }
        
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
    // 复杂度 O(n^2), swap函数时间复杂度 O(n^2)
    mutating func bubbleSort() -> [Element] {
        if self.count < 2 {
            return self
        }
        
        for i in 0...self.count-2 {
            for j in i...self.count-1 {
                if self[j] < self[i] {
                    self.swapAt(i, j)
                }
            }
        }
        return self;
    }
    
    // MARK: - 插入排序
    // 复杂度 低于O(n^2), swap函数时间复杂度 大于O(n)
    mutating func insertionSort() -> [Element] {
        if self.count < 2 {
            return self
        }
        
        for i in 1..<self.count {
            let tmp = self[i]
            var idx = -1
            for j in 1...i {
                if self[i - j] > tmp {
                    idx = i - j
                    self[idx+1] = self[idx]
                } else {
                    break
                }
            }
            if idx > -1 && idx != i {
                self[idx] = tmp
            }
        }
        
        return self;
    }
}
