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
    static func generateRandomArray(count: UInt32, maxValue: UInt32) -> Array<UInt32> {
        
        var arr = Array<UInt32>()
        for _ in 1...count {
            let num = arc4random_uniform(maxValue)
            arr.append(num)
        }
        
        return arr
    }
    
    static func testSort(sortName: String, sort: () -> Void) -> Void {
        
        let startTime = Date().timeIntervalSince1970
        
        sort()
        
        let endTime = Date().timeIntervalSince1970
        
        print("\(sortName) 排序完毕，耗时：\(endTime - startTime)")
    }
}
