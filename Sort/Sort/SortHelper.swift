//
//  SortHelper.swift
//  Sort
//
//  Created by geekbruce on 2018/9/26.
//  Copyright © 2018 qianbao. All rights reserved.
//

import Foundation

struct SortHelper {
    
    /// 生成一个随机数数组
    ///
    /// - Parameters:
    ///   - count: 要生成的数组的元素个数
    ///   - maxValue: 生成的元素最大随机值，最小默认为0
    /// - Returns: 生成的随机数数组
    static func generateRandomArray(count: UInt32, maxValue: UInt32) -> [UInt32] {
        
        var arr = [UInt32]()
        for _ in 1...count {
            let num = arc4random_uniform(maxValue)
            arr.append(num)
        }
        
        return arr
    }
    
//    static func testSort(sortName: String, sort: ([UInt32]) -> [UInt32]) -> Void {
//        
//        let startTime = Date().timeIntervalSince1970
//        
//        let sortedArr = sort(arr)
//        
//        let endTime = Date().timeIntervalSince1970
//        
//        assert(self.checkSort(arr: sortedArr))
//        
//        print("\(sortName) 排序完毕，耗时：\(startTime - endTime)")
//    }
    
    /// 检测数组是否已从小到大排序
    ///
    /// - Parameter arr: 要检测的数组
    /// - Returns: 是否已排序
    static func checkSort(arr: [UInt32]) -> Bool {
        
        for i in 0...arr.count-2 {
            if arr[i+1] < arr[i] {
                return false
            }
        }
        return true
    }
    
    
}
