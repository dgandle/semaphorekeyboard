//
//  SemaphoreModel.swift
//  semaphore-keyboard
//
//  Created by Doug Gandle on 4/28/19.
//  Copyright © 2019 Doug Gandle. All rights reserved.
//

import Foundation

struct SemaphorePosition: Hashable{
    var left: Int = 0
    var right: Int = 0
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(left)
        hasher.combine(right)
    }
    
    static func == (lhs: SemaphorePosition, rhs: SemaphorePosition) -> Bool {
        return lhs.left == rhs.left && lhs.right == rhs.right
    }
}

let semaphoreDictionary: [SemaphorePosition: String] = [
    SemaphorePosition(left: 5, right: 4): "A",
    SemaphorePosition(left: 6, right: 4): "B",
    SemaphorePosition(left: 7, right: 4): "C",
    SemaphorePosition(left: 0, right: 4): "D",
    SemaphorePosition(left: 4, right: 1): "E",
    SemaphorePosition(left: 4, right: 2): "F",
    SemaphorePosition(left: 4, right: 3): "G",
    SemaphorePosition(left: 6, right: 5): "H",
    SemaphorePosition(left: 7, right: 5): "I",
    SemaphorePosition(left: 0, right: 2): "J",
    SemaphorePosition(left: 5, right: 0): "K",
    SemaphorePosition(left: 5, right: 1): "L",
    SemaphorePosition(left: 5, right: 2): "M",
    SemaphorePosition(left: 5, right: 3): "N",
    SemaphorePosition(left: 6, right: 7): "O",
    SemaphorePosition(left: 6, right: 0): "P",
    SemaphorePosition(left: 6, right: 1): "Q",
    SemaphorePosition(left: 6, right: 2): "R",
    SemaphorePosition(left: 6, right: 3): "S",
    SemaphorePosition(left: 7, right: 0): "T",
    SemaphorePosition(left: 7, right: 1): "U",
    SemaphorePosition(left: 0, right: 3): "V",
    SemaphorePosition(left: 1, right: 2): "W",
    SemaphorePosition(left: 1, right: 3): "X",
    SemaphorePosition(left: 7, right: 2): "Y",
    SemaphorePosition(left: 3, right: 2): "Z",
    SemaphorePosition(left: 3, right: 5): " ",
]
