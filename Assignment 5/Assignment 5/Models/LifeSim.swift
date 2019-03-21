//
//  Cell.swift
//  Assignment 5
//
//  Created by Student on 3/18/19.
//  Copyright © 2019 Tanaka. All rights reserved.
//

import Foundation
extension Notification.Name {
    static let dataUpdated = Notification.Name("dataUpdated")
}

let size = GAME_SIZE


class LifeSim {
    var timer: Timer?
    
    var states: [[State]] = Array(repeating: (Array(repeating: .Dead, count: size)), count: size)
    
    private func reset(){
       states = Array(repeating: (Array(repeating: .Dead, count: states.count)), count: states.count)
        
        
        
    }
    
    
    private func dupStates() -> [[State]]{
        
        var copy: [[State]] = Array(repeating: (Array(repeating: .Dead, count: size)), count: size)
        
        for x in 0 ..< states.count {
            for y in 0 ..< states.count {
                copy[x][y] = states[x][y]
            }
        }
        
        return copy

    }
    
    func stateForXY(x: Int, y: Int) -> State? {
        if (x >= 0 && x < states.count) && (  y >= 0 && y < states.count){
            return states[x][y]
        }else{
            return nil
        }
    }
     func toggleStateForXY(x: Int, y: Int){
        if states[x][y] == .Living{
            states[x][y] = .Dead
        }else if states[x][y] == .Dead{
            states[x][y] = .Living
        }
        //post notification
        NotificationCenter.default.post(name: .dataUpdated, object: nil)
        
    }
    

    func duplicateBoard() -> [[State]]{
        
        var copy: [[State]] = Array(repeating: Array(repeating: .Dead, count: states.count), count: states.count)
        for x in 0 ..< states.count{
            for y in 0 ..< states.count{
                copy[x][y] = states[x][y]
            }
        }

        return copy

    }
    func numOfNeighbors(states: [[State]], x: Int, y: Int) -> Int {
        
        
        var neighbors = 0
        for x1 in x-1...x+1{
            for y1 in y-1...y+1{
                
                let checkX = states.torodialIndex(index: (x1))
                let checkY = states.torodialIndex(index: (y1))
                if !(checkX == x && checkY == y){
                    if states[checkX][checkY] == .Living {
                        neighbors += 1
                        
                    }
                    
                }
            }
        }
        return neighbors
    }
    
    
    /*
   if alive and neighbors  <2 or >3 == Dead
    if dead but neighbors == 3 then Alive
  */
    
    func evolveCell(x:Int, y:Int, stateCopy: [[State]]) {
        
        
        
        let neighbors = numOfNeighbors(states: stateCopy, x: x, y: y)
        
        if states[x][y] == .Living && (neighbors < 2 || neighbors > 3){
            toggleStateForXY(x: x, y: y)
        }
        else if states[x][y] == .Dead && neighbors == 3 {
            toggleStateForXY(x: x, y: y)
        }
        
        
        
    }
    func evolveGameBoard(){
        let stateCopy = dupStates()
        print("Pre loop - \(states)")
        for x in 0 ..< states.count{
            for y in 0 ..< states.count{
                self.evolveCell(x: x, y: y, stateCopy: stateCopy)
            }
            
        }
        
        print("After loop - \(states)")
    }
    var isRunning: Bool{
        return timer != nil
    }
    
    func runSim(){
        if timer == nil{
                timer = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true, block: { (timer) in
                    self.evolveGameBoard()
            })
        }
        
    }

        
    
}
