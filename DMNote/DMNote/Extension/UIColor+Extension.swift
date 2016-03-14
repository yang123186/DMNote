//
//  UIColor+Extension.swift
//  DMNote
//
//  Created by 杨容清 on 16/3/14.
//  Copyright © 2016年 杨容清. All rights reserved.
//

import UIKit

extension UIColor {
    class func noteNormalColor() -> UIColor{
        return  RGBCOLOR(255, g: 177, b: 0)
    }
    
    class func noteBackgroundColor() -> UIColor {
        return RGBACOLOR(255, g: 177, b: 0, a: 0.2);
    }
    
    class func noteCantClickedColor() -> UIColor {
        return RGBCOLOR(200, g: 200, b: 200)
    }
    
}