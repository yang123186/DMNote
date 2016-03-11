//
//  DMMainTableViewCell.swift
//  DMNote
//
//  Created by 杨容清 on 16/3/11.
//  Copyright © 2016年 杨容清. All rights reserved.
//

import UIKit
import SnapKit

let  mainCellOffset:CGFloat  =   50.0

class DMMainTableViewCell: UITableViewCell {
    
    var editerMode:Bool = false
    
    lazy private var accessoryLeftIcon:UIControl = {
        var control = UIControl()
        control.addSubview(self.leftImageView)
        self.leftImageView.snp_makeConstraints(closure: { (make) -> Void in
            make.centerX.equalTo(control)
            make.width.equalTo(22)
            make.centerY.equalTo(control)
            make.height.equalTo(22)
        })
        self.leftImageView.image = UIImage(named: "iconfont-check-normal")
        self.leftImageView.layer.cornerRadius = 11
        self.leftImageView.layer.masksToBounds = true
        self.leftImageView.backgroundColor = UIColor.clearColor()
        control.addTarget(self, action: Selector("checkButtonClicked"), forControlEvents: .TouchUpInside)
        control.alpha = 0;
        return control
    }()
    
    lazy private var leftImageView:UIImageView = {
       var imageView = UIImageView()
        return imageView
    }()
    
    lazy private var leftTextLable:UILabel = {
        var label = UILabel()
        return label
    }()
    
    lazy private var rightTextLabel:UILabel = {
        var label = UILabel()
        return label
    }()
    
    lazy private var accessoryRightIcon:UIImageView = {
        var imageView = UIImageView()
        return imageView
    }()
    
    lazy private var mainView:UIView = UIView()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.loadUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func loadUI() {
        let backgroundColor = RGBACOLOR(255, g: 177, b: 0, a: 0.2);
        let imageView = UIImageView()
        imageView.backgroundColor = backgroundColor
        self.selectedBackgroundView = imageView
        self.contentView.addSubview(mainView);
        mainView.addSubview(accessoryLeftIcon)
        mainView.addSubview(leftTextLable)
        mainView.addSubview(rightTextLabel)
        mainView.addSubview(accessoryRightIcon)
        mainView.snp_makeConstraints { (make) -> Void in
            make.right.equalTo(self)
            make.bottom.equalTo(self).offset(-0.5)
            make.top.equalTo(self)
            make.width.equalTo(SCREENWIDTH + 44)
        }
        
        accessoryLeftIcon.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(mainView).offset(3)
            make.width.equalTo(44)
            make.centerY.equalTo(self)
            make.height.equalTo(44)
        }
        
        
    }
    
    internal func switchEditMode(editerMode:Bool, animate:Bool) {
        self.editerMode = editerMode
        weak var weakSelf = self
        if editerMode {
            UIView.animateWithDuration(0.3) { () -> Void in
                weakSelf!.mainView.snp_updateConstraints(closure: { (make) -> Void in
                    make.right.equalTo(weakSelf!).offset(mainCellOffset)
                })
                weakSelf!.accessoryLeftIcon.alpha = 1
                weakSelf!.layoutIfNeeded()
            }
        }
        else {
            leftImageView.image = UIImage(named: "iconfont-check-normal")
            leftImageView.backgroundColor = UIColor.clearColor()
            selected = false
            UIView.animateWithDuration(0.3) { () -> Void in
                weakSelf!.mainView.snp_updateConstraints(closure: { (make) -> Void in
                    make.right.equalTo(weakSelf!)
                })
                weakSelf!.accessoryLeftIcon.alpha = 0
                weakSelf!.layoutIfNeeded()
            }
        }
    }
    
    internal func checkButtonClicked() {
        if !self.selected {
            leftImageView.image = UIImage(named: "iconfont-check-selected")
            leftImageView.backgroundColor = RGBCOLOR(255, g: 177, b: 0)
            self.selected = true
        }
        else {
            leftImageView.image = UIImage(named: "iconfont-check-normal")
            leftImageView.backgroundColor = UIColor.clearColor()
            self.selected = false
        }
    }
}
