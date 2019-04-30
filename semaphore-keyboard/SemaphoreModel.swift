//
//  SemaphoreModel.swift
//  semaphore-keyboard
//
//  Created by Doug Gandle on 4/28/19.
//  Copyright © 2019 Doug Gandle. All rights reserved.
//

import Foundation

enum FlagDirection {
    case left
    case right
    
    var toString: String {
        switch self {
        case .left:
            return "left"
        case .right:
            return "right"
        }
    }
}

enum SemaphoreCharacter {
    case a
    case b
    case c
    case d
    case e
    case f
    case g
    case h
    case i
    case j
    case k
    case l
    case m
    case n
    case o
    case p
    case q
    case r
    case s
    case t
    case u
    case v
    case w
    case x
    case y
    case z
    case space
    case delete
    
    var toString: String? {
        switch self {
        case .a:
            return "a"
        case .b:
            return "b"
        case .c:
            return "c"
        case .d:
            return "d"
        case .e:
            return "e"
        case .f:
            return "f"
        case .g:
            return "g"
        case .h:
            return "h"
        case .i:
            return "i"
        case .j:
            return "j"
        case .k:
            return "k"
        case .l:
            return "l"
        case .m:
            return "m"
        case .n:
            return "n"
        case .o:
            return "o"
        case .p:
            return "p"
        case .q:
            return "q"
        case .r:
            return "r"
        case .s:
            return "s"
        case .t:
            return "t"
        case .u:
            return "u"
        case .v:
            return "v"
        case .w:
            return "w"
        case .x:
            return "x"
        case .y:
            return "y"
        case .z:
            return "z"
        case .space:
            return " "
        case .delete:
            return nil
        }
    }
}

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

let semaphoreDictionary: [SemaphorePosition: SemaphoreCharacter] = [
    SemaphorePosition(left: 5, right: 4): .a,
    SemaphorePosition(left: 6, right: 4): .b,
    SemaphorePosition(left: 7, right: 4): .c,
    SemaphorePosition(left: 0, right: 4): .d,
    SemaphorePosition(left: 4, right: 1): .e,
    SemaphorePosition(left: 4, right: 2): .f,
    SemaphorePosition(left: 4, right: 3): .g,
    SemaphorePosition(left: 6, right: 5): .h,
    SemaphorePosition(left: 7, right: 5): .i,
    SemaphorePosition(left: 0, right: 2): .j,
    SemaphorePosition(left: 5, right: 0): .k,
    SemaphorePosition(left: 5, right: 1): .l,
    SemaphorePosition(left: 5, right: 2): .m,
    SemaphorePosition(left: 5, right: 3): .n,
    SemaphorePosition(left: 6, right: 7): .o,
    SemaphorePosition(left: 6, right: 0): .p,
    SemaphorePosition(left: 6, right: 1): .q,
    SemaphorePosition(left: 6, right: 2): .r,
    SemaphorePosition(left: 6, right: 3): .s,
    SemaphorePosition(left: 7, right: 0): .t,
    SemaphorePosition(left: 7, right: 1): .u,
    SemaphorePosition(left: 0, right: 3): .v,
    SemaphorePosition(left: 1, right: 2): .w,
    SemaphorePosition(left: 1, right: 3): .x,
    SemaphorePosition(left: 7, right: 2): .y,
    SemaphorePosition(left: 3, right: 2): .z,
    SemaphorePosition(left: 3, right: 5): .space,
    SemaphorePosition(left: 7, right: 3): .delete
]
