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
    var dataSource: GameDataSource?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let tap = UITapGestureRecognizer(target: self, action: #selector(onTapped(_:)))
        self.addGestureRecognizer(tap)
    }
    
    @objc func onTapped(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended{
            let location = sender.location(ofTouch: 0, in: self)
            
            let controlSize = self.bounds.size.width < self.bounds.size.height ? self.bounds.size.width : self.bounds.size.height
            let cellSize = controlSize / CGFloat(xyGridSize)
            let x = Int((location.x / cellSize).rounded(.down))
            let y = Int((location.y / cellSize).rounded(.down))
            delegate?.cellTappedItemAtX(x, andY: y)
            
            print("x = \(location.x)  y=\(location.y)")
            print("x = \(x) , y = \(y)")
        }
    }
    
    
    
    
    func drawGrid() {
        let controlSize = self.bounds.size.width < self.bounds.size.height ? self.bounds.size.width : self.bounds.size.height
        let cellSize = controlSize / CGFloat(xyGridSize)
        
        let linePath = UIBezierPath()
        /*linePath.move(to: CGPoint(x: 0, y: cellSize * 0))
         linePath.addLine(to: CGPoint(x: controlSize, y: cellSize * 0))
         linePath.move(to: CGPoint(x: 0, y: cellSize * 1))
         linePath.addLine(to: CGPoint(x: controlSize, y: cellSize * 1))
         
         linePath.move(to: CGPoint(x: 0, y: cellSize * 2))
         linePath.addLine(to: CGPoint(x: controlSize, y: cellSize * 2))
         
         linePath.move(to: CGPoint(x: 0, y: cellSize * 3))
         linePath.addLine(to: CGPoint(x: controlSize, y: cellSize * 3))
        
        linePath.move(to: CGPoint(x: cellSize * 0, y: 0))
        linePath.addLine(to: CGPoint(x: cellSize * 0, y: controlSize ))
        linePath.move(to: CGPoint(x: cellSize * 1, y: 0))
        linePath.addLine(to: CGPoint(x: cellSize * 1, y: controlSize ))
        linePath.move(to: CGPoint(x: cellSize * 2, y: 0))
        linePath.addLine(to: CGPoint(x: cellSize * 2, y: controlSize ))
        linePath.move(to: CGPoint(x: cellSize * 3, y: 0))
        linePath.addLine(to: CGPoint(x: cellSize * 3, y: controlSize ))
 */
        
        
       
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
    
    private func rectForCellAtX(_ x: Int, andY y: Int) -> CGRect{
        let controlSize = self.bounds.size.width < self.bounds.size.height ? self.bounds.size.width : self.bounds.size.height
        let cellSize = controlSize / CGFloat(xyGridSize)
        
        
        return CGRect(x: cellSize * CGFloat(x), y: cellSize * CGFloat(y), width: cellSize, height: cellSize)
        
    }
    func colorForCell(state: State) -> UIColor {
        switch state {
        case .Dead:
            return UIColor.blue
        case .Living:
            return UIColor.red
        default:
            return UIColor.white
        }
    }
    
    override func draw(_ rect: CGRect) {
        if let datasource = dataSource {
            for x in 0 ..< xyGridSize {
                for y in 0 ..< xyGridSize {
                    if let color = datasource.colorForCellAtX(x, andY: y) {
                        
                    
                    let cellRect = rectForCellAtX(x, andY: y)
                    
                    let cellPath = UIBezierPath(rect: cellRect)
                        color.set()
                    cellPath.fill()
                }
                }
            }
        }
        
       
        
        // Drawing code
       drawGrid()
        
        
    }
 

}



