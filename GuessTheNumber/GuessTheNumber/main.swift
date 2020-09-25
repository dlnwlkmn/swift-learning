//
//  main.swift
//  GuessTheNumber
//
//  Created by Алексей Савельев on 31.08.2020.
//  Copyright © 2020 Алексей Савельев. All rights reserved.
//

import Foundation

let randomNumber = String(arc4random_uniform(100))

print("Компьютер случайным образом загодал число [0,100], и вам предлагается его отгадать")

var messages = ["start":"Ведите число и нажмите клавишу Enter",
                "win":"Ура, вы отгадали число...",
                "more":"Число больше чем вам кажется",
                "less":"Число меньше чем вам кажется"]

var inputNumber: String = ""

repeat {
    print("")
    print(messages["start"]!)
    inputNumber = readLine() ?? ""
    if inputNumber > randomNumber {
        print(messages["less"]!)
    } else {
        print(messages["more"]!)
    }
} while inputNumber != randomNumber

print(messages["win"]!)



