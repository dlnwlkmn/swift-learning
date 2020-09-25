//
//  main.swift
//  MyFirstApp
//
//  Created by Алексей Савельев on 31.08.2020.
//  Copyright © 2020 Алексей Савельев. All rights reserved.
//

import Foundation

var answer: String?

repeat{
    print("Введите значение первого аргумента")

    let a =  readLine()

    print("Введите значение второго аргумента")

    let b = readLine()

    let res = summ(a, b)

    print("Результат сложения: \(res)")
    print("Хотите продолжить? (y,n)")

    answer = readLine()
} while (answer == "y")


