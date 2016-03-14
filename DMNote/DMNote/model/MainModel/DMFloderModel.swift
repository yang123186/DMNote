//
//  DMMainCellModel.swift
//  DMNote
//
//  Created by 杨容清 on 16/3/14.
//  Copyright © 2016年 杨容清. All rights reserved.
//

import UIKit

class DMFloderModel: NSObject {
    var floderName:String?
    var floderNumber:Int?
    var floderId:Int?
    
    init(name:String) {
        super.init()
        self.floderNumber = 0
        self.floderName = name
    }
}
