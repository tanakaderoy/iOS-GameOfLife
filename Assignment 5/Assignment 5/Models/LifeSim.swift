//
//  Cell.swift
//  Assignment 5
//
//  Created by Student on 3/18/19.
//  Copyright © 2019 Tanaka. All rights reserved.
//

import Foundation

class LifeSim {
    
    
    var states = [[State]]()
    
    private func reset(){
       states = Array(repeating: (Array(repeating: .Dead, count: states.count)), count: states.count)
        
        
        
    }
    
    private func stateForXY(x: Int, y: Int) -> State? {
        if (x >= 0 && x < states.count) && (  y >= 0 && y < states.count){
            return states[x][y]
        }else{
            return nil
        }
    }
    private func toggleStateForXY(x: Int, y: Int){
        if states[x][y] == .Living{
            states[x][y] = .Dead
        }else{
            states[x][y] = .Living
        }
        //post notification
        
    }
    
    func runSim(){
        
    }
    
    func duplicateBoard() -> [[State]]{
        
        var copy: [[State]] = Array(repeating: Array(repeating: .Dead, count: states.count), count: states.count)
        for x in 0 ..< states.count{
            for y in 0 ..< states.count{
                copy[x][y] = states[x][y]
            }
        }

        

    }
    func numOfNeighbors(states: [[State]], x: Int, y: Int) -> Int {
        let stateCopy = duplicateBoard()
        var neighbors = 0
        for x1 in -1...1{
            for y1 in -1...1{
                
                let checkX = states.torodialIndex(index: (x1))
                let checkY = states.torodialIndex(index: (y1))
            }
        }
        return neighbors
    }
    
    
    /*
   if alive and neighbors  <2 or >3 == Dead
    if dead but neighbors == 3 then Alive
  */
    
    func evolveCell(x:Int, y:Int) {
        var neighbors = numOfNeighbors(x: x, y: y)
        if states[x][y] == .Living && (neighbors < 2 || neighbors > 3){
            toggleStateForXY(x: x, y: y)
        }
        if states[x][y] == .Dead && neighbors == 3 {
            <#code#>
        }
        
    }
    
    
    
}
