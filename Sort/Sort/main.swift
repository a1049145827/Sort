//
//  main.swift
//  Sort
//
//  Created by geekbruce on 2018/9/26.
//  Copyright © 2018 qianbao. All rights reserved.
//

import Foundation

print("Hello, World!")

var arr = [ 39, 453, 42, 6, 24, 5, 0, 35]

print(arr.selectionSort())

var students: [Student] = [ Student.init(name: "R", score: 96), Student.init(name: "G", score: 86), Student.init(name: "D", score: 88), Student.init(name: "S", score: 96), Student.init(name: "V", score: 80) ]

print(students.selectionSort())
