//
//  Util.swift
//  Assignment 5
//
//  Created by tanaka on 3/19/19.
//  Copyright © 2019 Tanaka. All rights reserved.
//

import Foundation
var GAME_SIZE = 24

extension Array {
    func torodialIndex(index: Int) -> Int{
        return (self.count + index) % self.count
    }
}
