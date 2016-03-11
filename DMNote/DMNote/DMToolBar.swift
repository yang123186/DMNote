//
//  DMToolBar.swift
//  DMNote
//
//  Created by 杨容清 on 16/3/10.
//  Copyright © 2016年 杨容清. All rights reserved.
//

import UIKit

class DMToolBar: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        let image = UIImage(named: "bg_note")
        self.layer.contents = image!.CGImage
        self.layer.backgroundColor = UIColor.clearColor().CGColor
        self.alpha = 0.9
        let lineView = UIView(frame: CGRect(x: 0, y: 0, width: SCREENWIDTH, height: 0.5))
        self.addSubview(lineView)
        lineView.backgroundColor = RGBCOLOR(177, g: 177, b: 177)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        let context = UIGraphicsGetCurrentContext()
        CGContextSetAllowsAntialiasing(context, true)
        CGContextSetStrokeColorWithColor(context, RGBCOLOR(177, g: 177, b: 177).CGColor)
        CGContextSetLineWidth(context, 1)
        CGContextMoveToPoint(context, 0, 0)
        CGContextAddLineToPoint(context, SCREENWIDTH, 0)
        CGContextStrokePath(context)
    }
}
