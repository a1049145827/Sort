//
//  main.swift
//  Sort
//
//  Created by geekbruce on 2018/9/26.
//  Copyright © 2018 qianbao. All rights reserved.
//

import Foundation

print("Hello, World!")

//var arr = [ -1, 39, 453, 42, 6, 24, 5, 0, 35, 4562]
var arr = SortHelper.generateRandomArray(count: 32, maxValue: 100)
print(arr)

//print(arr.selectionSort())
print(arr.bubbleSort())

var students: [Student] = [ Student.init(name: "R", score: 96), Student.init(name: "G", score: 86), Student.init(name: "D", score: 88), Student.init(name: "S", score: 96), Student.init(name: "V", score: 80), Student.init(name: "A", score: 96) ]

//print(students.selectionSort())
print(students.bubbleSort())
