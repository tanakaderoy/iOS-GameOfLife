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
    var lifesim = LifeSim()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateUI), name: .dataUpdated, object: nil)
        
        
        
        gameBoard.delegate = self
        gameBoard.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    @objc func updateUI() {
        gameBoard.setNeedsDisplay()
    }
    
    @IBAction func statButtonTouched(_ sender: UIButton) {
        lifesim.runSim()
    }
    

}

extension ViewController: GameDelegate, GameDataSource{
    //in future get a data structure looking at each cell and looking to see if each cell hass a organism. on or off
    func colorForCellAtX(_ x: Int, andY y: Int) -> UIColor? {
        
        if let state = lifesim.stateForXY(x: x, y: y) {
            if state == .Living{
                return UIColor.yellow
            }
        }
        return nil
    }

    

    
    func cellTappedItemAtX(_ x: Int, andY y: Int) {
        print("cell tapped at : (\(x), \(y))")
    lifesim.toggleStateForXY(x: x, y: y)
        
        
        
    
   
    
    
}
}

