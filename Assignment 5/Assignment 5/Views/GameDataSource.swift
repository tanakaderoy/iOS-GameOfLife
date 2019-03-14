//
//  GameDataSource.swift
//  Assignment 5
//
//  Created by Student on 3/13/19.
//  Copyright © 2019 Tanaka. All rights reserved.
//

import Foundation
import UIKit
protocol GameDataSource {
    func colorForCellAtX(_ x: Int, andY y: Int) -> UIColor?
}
