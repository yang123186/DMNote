//
//  DMMainTableViewCell.swift
//  DMNote
//
//  Created by 杨容清 on 16/3/11.
//  Copyright © 2016年 杨容清. All rights reserved.
//

import UIKit
import SnapKit

class DMMainTableViewCell: UITableViewCell {
    
    lazy var mainView:UIView = UIView()
    lazy var accessoryLeftIcon:UIImageView = {
        var imageView = UIImageView()
        return imageView
    }()
    
    lazy var leftTextLable:UILabel = {
        var label = UILabel()
        return label
    }()
    
    lazy var rightTextLabel:UILabel = {
        var label = UILabel()
        return label
    }()
    
    lazy var accessoryRightIcon:UIImageView = {
        var imageView = UIImageView()
        return imageView
    }()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.loadUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func loadUI() {
        self.addSubview(mainView);
        mainView.addSubview(accessoryLeftIcon)
        mainView.addSubview(leftTextLable)
        mainView.addSubview(rightTextLabel)
        mainView.addSubview(accessoryRightIcon)
        mainView.snp_makeConstraints { (make) -> Void in
            make.right.equalTo(self)
            make.bottom.equalTo(self)
            make.top.equalTo(self)
            make.width.equalTo(SCREENWIDTH + 44)
        }
    }
}
