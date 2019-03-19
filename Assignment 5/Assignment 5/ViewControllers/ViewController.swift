//
//  ViewController.swift
//  Assignment 5
//
//  Created by Student on 3/12/19.
//  Copyright © 2019 Tanaka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gameBoard: GameBoardView!
    var data: [[Int]]!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data = Array(repeating: (Array(repeating: 0, count: 24)), count: 24)
        data[0][0] = 1
        data[23][23] = 1
        data[0][1] = 1
        
        
        gameBoard.delegate = self
        gameBoard.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    


}

extension ViewController: GameDelegate, GameDataSource{
    //in future get a data structure looking at each cell and looking to see if each cell hass a organism. on or off
    func colorForCellAtX(_ x: Int, andY y: Int) -> UIColor? {
        if data[x][y] != 0 {
            return UIColor.yellow
        }else{
            return nil
        }
    }

    

    
    func cellTappedItemAtX(_ x: Int, andY y: Int) {
        print("cell tapped at : (\(x), \(y))")
        
        
        if data[x][y] == 0 {
            data[x][y] = 1
            
        
        
        }else{
            data[x][y] = 0
        }
        gameBoard.setNeedsDisplay()
    
   
    
    
}
}

