//
//  UIView+Extension.swift
//  DMNote
//
//  Created by 杨容清 on 16/3/9.
//  Copyright © 2016年 杨容清. All rights reserved.
//

import UIKit

extension UIView {
    var width:CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            var rect = self.frame
            rect.size.width = newValue
            self.frame = rect
        }
    }
    
    var height:CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            var rect = self.frame
            rect.size.height = newValue
            self.frame = rect
        }
    }
    
    var originX:CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            var rect = self.frame
            rect.origin.x = newValue
            self.frame = rect
        }
    }
    
    var originY:CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            var rect = self.frame
            rect.origin.y = newValue
            self.frame = rect
        }
    }
    
    var centerX:CGFloat {
        get {
            return self.center.x
        }
        
        set {
            var point = self.center
            point.x = newValue
            self.center = point
        }
    }
    
    var centerY:CGFloat {
        get {
            return self.center.y
        }
        set {
            var point = self.center
            point.y = newValue
            self.center = point
        }
    }
}
