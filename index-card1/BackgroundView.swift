//
//  BackgroundView.swift
//  index-card1
//
//  Created by John Pavley on 11/6/15.
//  Copyright © 2015 John Pavley. All rights reserved.
//

import UIKit

@IBDesignable

class BackgroundView: UIView {

    
    override func drawRect(rect: CGRect) {
        
        let viewWidth:CGFloat = self.bounds.width
        print("viewWidth \(viewWidth)")
        print("rect.size.width \(rect.size.width)")
        
        let viewHight:CGFloat = self.bounds.height
        print("viewHight \(viewHight)")
        print("rect.size.height \(rect.size.height)")
        
        
        let x1:CGFloat = 0.0
        let x2:CGFloat = viewWidth
        
        let y1:CGFloat = 0.0
        let y2:CGFloat = viewHight
        
        let cellLength:CGFloat = min(viewHight, viewWidth) / 15
        print("rowHeight \(cellLength)")
        
        let lineWidth:CGFloat = 2.0
        
        let context = UIGraphicsGetCurrentContext()
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        let components: [CGFloat] = [0.0, 0.0, 1.0, 1.0]
        let color = CGColorCreate(colorSpace, components)
        
        CGContextSetLineWidth(context, lineWidth)
        CGContextSetStrokeColorWithColor(context, color)
        
        // draw horizontal lines
        var i:CGFloat = 0.0
        repeat {
            
            CGContextMoveToPoint(context, x1, cellLength + i)
            CGContextAddLineToPoint(context, x2, cellLength + i)
            
            i = i + cellLength
            
        } while i < rect.height - cellLength
        
        
        // draw vertical lines
        var j:CGFloat = 0.0
        repeat {
            
            CGContextMoveToPoint(context, cellLength + j, y1)
            CGContextAddLineToPoint(context, cellLength + j, y2)
            
            j = j + cellLength
            
        } while j < rect.width - cellLength

        CGContextStrokePath(context)
    }
    

}
