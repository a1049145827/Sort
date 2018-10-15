//
//  Array+Extension.swift
//  Sort
//
//  Created by geekbruce on 2018/9/26.
//  Copyright © 2018 qianbao. All rights reserved.
//

import Foundation

extension Array where Element: Comparable {
    
    // MARK: - 是否已经排序
    public var isSorted: Bool {
        for i in 0..<self.count-2 {
            if self[i] > self[i+1] {
                return false
            }
        }
        return true
    }
    
    // MARK: - 选择排序
    // 复杂度 O(n^2), swap函数时间复杂度 O(n)
    @discardableResult mutating func selectionSort() -> [Element] {
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
    @discardableResult mutating func bubbleSort() -> [Element] {
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
    @discardableResult mutating func insertionSort() -> [Element] {
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
    
    // MARK: - 归并排序，复杂度 O(n^logn)
    @discardableResult mutating func mergeSort() -> [Element] {
        
        __mergeSort(l: 0, r: self.count - 1)
        
        return self
    }
    
    private mutating func __mergeSort(l: Int, r: Int) -> Void {
        
        if l >= r {
            return
        }
        
        let q = (l + r) / 2
        
        __mergeSort(l: l, r: q)
        __mergeSort(l: q+1, r: r)
        
        if self[q] > self[q+1] {

            __merge(l: l, r: r, q: q)
        }
    }
    
    private mutating func __merge(l: Int, r: Int, q: Int) -> Void {
        
        // 临时c数组元素个数
        let c = r - l + 1
        var arr = [Element](repeating: self[0], count: c)
        for i in l...r {
            arr[i-l] = self[i]
        }
        
        var i = l
        var j = q+1
        
        for k in l...r {
            let tmpI = i - l
            let tmpJ = j - l
            
            if i > q {
                self[k] = arr[tmpJ];
                j += 1
            } else if j > r {
                self[k] = arr[tmpI]
                i += 1
            } else if arr[tmpI] < arr[tmpJ] {
                self[k] = arr[tmpI]
                i += 1
            } else {
                self[k] = arr[tmpJ]
                j += 1
            }
        }
    }
    
    // MARK: - 快速排序
    @discardableResult mutating func quickSort() -> [Element] {
        
        __quickSort(l: 0, r: self.count - 1)
        
        return self
    }
    
    private mutating func __quickSort(l: Int, r: Int) -> Void {
        
        if l >= r {
            return;
        }
        
        let q = __quick(l: l, r: r)
        
        __quickSort(l: l, r: q - 1)
        __quickSort(l: q + 1, r: r)
    }
    
    private mutating func __quick(l: Int, r: Int) -> Int {
        
        let e = self[l]
        var j = l
        for i in l...r {
            if (self[i] < e) {
                self.swapAt(i, j + 1)
                j += 1
            }
        }
        self.swapAt(l, j)
        
        return j
    }
    
    // MARK: - 快速排序，双路快排
    @discardableResult mutating func quickSort2Way() -> [Element] {
        
        __quickSort2(l: 0, r: self.count - 1)
        
        return self
    }
    
    private mutating func __quickSort2(l: Int, r: Int) -> Void {
        
        if l >= r {
            return
        }
        
        let q = __quick2(l: l, r: r)
        
        __quickSort2(l: l, r: q - 1)
        __quickSort2(l: q + 1, r: r)
    }
    
    private mutating func __quick2(l: Int, r: Int) -> Int {
        
        let e = self[l]
        var j = l+1
        var k = r
        
        while true {
            
            while j <= r && self[j] <= e {
                j += 1
            }
            while k > l && self[k] > e {
                k -= 1
            }
            if j >= k {
                break
            }
            
            swapAt(j, k)
            
            j += 1
            k -= 1
        }
        
        swapAt(l, k)
        
        return k
    }
    
    // MARK: - 快速排序，三路快排
    @discardableResult mutating func quickSort3Way() -> [Element] {
        
        __quickSort3(l: 0, r: self.count - 1)
        
        return self
    }
    
    private mutating func __quickSort3(l: Int, r: Int) -> Void {
        
        if l >= r {
            return
        }
        
        let (lt, gt) = __quick3(l: l, r: r)
        
        __quickSort3(l: l, r: lt - 1)
        __quickSort3(l: gt + 1, r: r)
    }
    
    private mutating func __quick3(l: Int, r: Int) -> (Int, Int) {
        
        let e = self[l]
        var lt = l
        var i = l + 1
        var gt = r
        
        while i <= gt {
            while gt > l && self[gt] > e {
                gt -= 1
            }
            if i > gt {
                break
            }
            if self[i] < e {
                
                swapAt(i, lt + 1)
                lt += 1
                i += 1
            } else if self[i] > e {
                if i != gt {
                    swapAt(i, gt)
                }
                gt -= 1
            } else {
                i += 1
            }
        }
        if l != lt {
            swapAt(l, lt)
        }
        
        return (lt, gt)
    }
}
