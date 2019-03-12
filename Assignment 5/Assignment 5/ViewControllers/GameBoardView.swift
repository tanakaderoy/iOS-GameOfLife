//
//  GameBoardView.swift
//  Assignment 5
//
//  Created by Student on 3/12/19.
//  Copyright © 2019 Tanaka. All rights reserved.
//

import UIKit

class GameBoardView: UIView {

    let xyGridSize = 24 //numberofcells in vid
    let gridColor = UIColor.red
    var delegate: GameDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let tap = UITapGestureRecognizer(target: self, action: #selector(onTapped(_:)))
        self.addGestureRecognizer(tap)
    }
    
    @objc func onTapped(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended{
            let location = sender.location(ofTouch: 0, in: self)
            
            let controlSize = self.bounds.size.width < self.bounds.height ? self.bounds.size.width : self.bounds.size.height
            let cellSize = controlSize / CGFloat(xyGridSize)
            let index = Int((location.x / cellSize).rounded(.down))
            delegate?.tappedItemAtIndex(index)
            
            print("x = \(location.x)  y=\(location.y)")
        }
    }
    
    func drawGrid() {
        let controlSize = self.bounds.size.width < self.bounds.height ? self.bounds.size.width : self.bounds.size.height
        let cellSize = controlSize / CGFloat(xyGridSize)
        
        let linePath = UIBezierPath()
        /*linePath.move(to: CGPoint(x: 0, y: cellSize * 0))
         linePath.addLine(to: CGPoint(x: controlSize, y: cellSize * 0))
         linePath.move(to: CGPoint(x: 0, y: cellSize * 1))
         linePath.addLine(to: CGPoint(x: controlSize, y: cellSize * 1))
         
         linePath.move(to: CGPoint(x: 0, y: cellSize * 2))
         linePath.addLine(to: CGPoint(x: controlSize, y: cellSize * 2))
         
         linePath.move(to: CGPoint(x: 0, y: cellSize * 3))
         linePath.addLine(to: CGPoint(x: controlSize, y: cellSize * 3))*/
        
        
        for index in 0...Int(controlSize) {
            //Horizontal Lines
            linePath.move(to: CGPoint(x: 0, y: cellSize * CGFloat(index)))
            linePath.addLine(to: CGPoint(x: controlSize, y: cellSize * CGFloat(index)))
            //Vertical Lines
            linePath.move(to: CGPoint(x: cellSize * CGFloat(index), y: 0))
            linePath.addLine(to: CGPoint(x: cellSize * CGFloat(index), y: controlSize ))
            
        }
        
        gridColor.set()
        linePath.lineWidth = 1.0
        linePath.stroke()
    }
    
    override func draw(_ rect: CGRect) {
        // Drawing code
       drawGrid()
        
        
    }
 

}


extension ViewController: GameDelegate{
    func tappedItemAtIndex(_ index: Int) {
        print("\(index)")
    }
    
    
}
