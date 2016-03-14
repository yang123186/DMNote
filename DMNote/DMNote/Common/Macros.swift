//
//  Macros.swift
//  Note
//
//  Created by 杨容清 on 16/3/9.
//  Copyright © 2016年 杨容清. All rights reserved.
//

import UIKit

let SCREEN_IPHONE6P          =   ((UIScreen.mainScreen().bounds.size.height) >= 736)
let SCREEN_IPHONE6           =   ((UIScreen.mainScreen().bounds.size.height) >= 667)
let SCREEN_IPHONE5           =   ((UIScreen.mainScreen().bounds.size.height) >= 568)
let IS_IOS9                  =   ((UIDevice.currentDevice().systemVersion as NSString).floatValue >= 9.0)
let IS_IOS8                  =   ((UIDevice.currentDevice().systemVersion as NSString).floatValue >= 8.0)
let IS_IOS7                  =   ((UIDevice.currentDevice().systemVersion as NSString).floatValue >= 7.0)
let IS_IOS6                  =   ((UIDevice.currentDevice().systemVersion as NSString).floatValue >= 6.0)

//about app:
let APP_VERSION              =   NSBundle.mainBundle().infoDictionary!["CFBundleShortVersionString"]

let DAY_SECOND               =   86400

//自定义导航条高度：可扩充
let STATUSBAR_HIGHT:CGFloat          =   20
let NAVBAR_HIGHTIOS_7:CGFloat        =   44 + 20
let kNavBarDefaultHeight:CGFloat     =   44
let NAVBAR_DEFAULT_HEIGHT:CGFloat    =   ((IS_IOS7) ? (NAVBAR_HIGHTIOS_7) : (44))
let STATUSBAR_DEFAULT_HEIGHT:CGFloat =   ((IS_IOS7) ? (0) : (STATUSBAR_HIGHT))

let SCREENWIDTH:CGFloat              =   UIScreen.mainScreen().bounds.size.width
let SCREENHEIGHT:CGFloat             =   UIScreen.mainScreen().bounds.size.height

let NAVBAR_HIGHT:CGFloat             =   UINavigationController().navigationBar.frame.size.height
let TABBAR_HEIGHT:CGFloat            =   49

let MainViewHeight                   =   SCREENHEIGHT - NAVBAR_DEFAULT_HEIGHT - STATUSBAR_DEFAULT_HEIGHT
let MainViewWidth                    =   SCREENWIDTH

//keyboard:
let NORMAL_KEYBOARD_HEIGHT:CGFloat   =   216.0
let USERNOTICENTER                   =   NSNotificationCenter.defaultCenter()

let NAVBAR_BGCOLOR                   =   RGBACOLOR(0xf9, g: 0xa0, b: 0x1e, a: 1.0)


//app FONTNANE:
let DEFAULT_FONTNANE                 =   "Arial"
let DEFAULT_FONTBOLDNANE             =   "Arial Rounded MT Bold"

// Color
func RGBACOLOR(r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor(red: r / 255.0, green: g/255.0, blue: b/255.0, alpha: a)
}

func RGBCOLOR(r:CGFloat, g:CGFloat, b:CGFloat) -> UIColor {
    return RGBACOLOR(r, g: g, b: b, a: 1)
}


