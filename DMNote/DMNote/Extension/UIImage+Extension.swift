//
//  UIImage+Extension.swift
//  DMNote
//
//  Created by 杨容清 on 16/3/14.
//  Copyright © 2016年 杨容清. All rights reserved.
//

import UIKit

extension UIImage {
    func imageWithTintColor(tintColor:UIColor) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(self.size, false, 0.0)
        tintColor.setFill()
        let bounds = CGRectMake(0, 0, self.size.width, self.size.height)
        UIRectFill(bounds)
        self.drawInRect(bounds, blendMode: .DestinationIn, alpha: 1.0)
        self.drawInRect(bounds, blendMode: .Overlay, alpha: 1.0)
        let tintImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return tintImage
    }
}