//
//  TriangleView.swift
//  TriangleView
//
//  Created by shoji on 2016/12/31.
//  Copyright © 2016年 shoji fujita. All rights reserved.
//

import UIKit

@IBDesignable final class TriangleView: UIView {
    
    open var direction = Direction.down
    @IBInspectable open var fillColor: UIColor = .red
    
    // 三角形の向きをIBで設定可能にする
    @IBInspectable var raw: Int = 0 {
        didSet {
            direction = Direction(rawValue: raw) ?? .down
        }
    }
    
    // 三角形の向き
    enum Direction: Int {
        case up
        case down
        case left
        case right
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let path = UIBezierPath()
        
        switch direction {
        case .up:
            path.move(to: CGPoint(x: 0, y: height()))
            path.addLine(to: CGPoint(x: width()/2, y: 0))
            path.addLine(to: CGPoint(x: width(), y: height()))
        case .down:
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: width()/2, y: height()))
            path.addLine(to: CGPoint(x: width(), y: 0))
        case .left:
            path.move(to: CGPoint(x: width(), y: 0))
            path.addLine(to: CGPoint(x: 0, y: height()/2))
            path.addLine(to: CGPoint(x: width(), y: height()))
        case .right:
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: width(), y: height()/2))
            path.addLine(to: CGPoint(x: 0, y: height()))
        }
        path.close()
        fillColor.setFill()
        path.fill()
    }
    
}

extension UIView {
    
    func x() -> CGFloat {
        return frame.origin.x
    }
    
    func y() -> CGFloat {
        return frame.origin.y
    }
    
    func width() -> CGFloat {
        return frame.width
    }
    
    func height() -> CGFloat {
        return frame.height
    }
    
}
