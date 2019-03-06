//
//  main.swift
//  Sort
//
//  Created by geekbruce on 2018/9/26.
//  Copyright © 2018 qianbao. All rights reserved.
//

import Foundation


print("Hello, World!")

//var arr = [ -1, 39, 453, 42, 6, 24, 5, 0, 35, 4562 ]
//let arr = [5, 4, 3, 3]

// Swift 中 Struct 具有“写时复制”的特性
let arr = SortHelper.generateRandomArray(count: 1000000, maxValue: 10000)

var arr0 = arr
var arr1 = arr
var arr2 = arr
var arr3 = arr
var arr4 = arr

//arr2.append(15)

//print(arr)

//print(arr.selectionSort())
//print(arr.bubbleSort())
//print(arr.insertionSort())
//print(arr.quickSort())
//print(arr.mergeSort())


SortHelper.testSort(sortName: "归并算法") {
    arr0.mergeSort()
    assert(arr0.isSorted)
}

SortHelper.testSort(sortName: "快速排序") {
    arr1.quickSort()
    assert(arr1.isSorted)
}

SortHelper.testSort(sortName: "双路快排") {
    arr2.quickSort2Way()
    assert(arr2.isSorted)
}

SortHelper.testSort(sortName: "三路快排") {
    arr3.quickSort3Way()
    assert(arr3.isSorted)
}

SortHelper.testSort(sortName: "Swift 自带排序") {
    arr4.sort()
    assert(arr4.isSorted)
}


var students: [Student] = [ Student.init(name: "R", score: 96), Student.init(name: "G", score: 86), Student.init(name: "D", score: 88), Student.init(name: "S", score: 96), Student.init(name: "V", score: 80), Student.init(name: "A", score: 96) ]

//print(students.selectionSort())
//print(students.bubbleSort())
//print(students.insertionSort())
print(students.quickSort())
