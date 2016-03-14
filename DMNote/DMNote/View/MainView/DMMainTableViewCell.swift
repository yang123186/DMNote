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

@objc protocol DMMainTableDelegate {
    optional func selectedDidChanged();
}

class DMMainTableViewCell: UITableViewCell {
//MARK: - 属性
    /// 编辑模式与非编辑模式的转化
    var editerMode:Bool = false {
        didSet {
            weak var weakSelf = self
            if editerMode {
                UIView.animateWithDuration(self.animateDuring) { () -> Void in
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
                UIView.animateWithDuration(self.animateDuring) { () -> Void in
                    weakSelf!.mainView.snp_updateConstraints(closure: { (make) -> Void in
                        make.right.equalTo(weakSelf!)
                    })
                    weakSelf!.accessoryLeftIcon.alpha = 0
                    weakSelf!.layoutIfNeeded()
                }
            }
        }
    }
    
    weak internal var mainTableDelegate: DMMainTableDelegate?
    /// 动画时间默认为0.0，有动画为0.3
    private var animateDuring = 0.0
    /// 编辑多选按钮
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
    /// 编辑多选按钮的图片
    lazy private var leftImageView:UIImageView = {
       var imageView = UIImageView()
        return imageView
    }()
    /// 文件夹名
    lazy private var leftTextLable:UILabel = {
        var label = UILabel()
        return label
    }()
    /// 文件夹内文件数
    lazy private var rightTextLabel:UILabel = {
        var label = UILabel()
        return label
    }()
    /// 箭头图片
    lazy private var accessoryRightIcon:UIImageView = {
        var imageView = UIImageView()
        return imageView
    }()
    /// 界面容器
    lazy private var mainView:UIView = UIView()
//MARK: - 界面加载
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
        
        leftTextLable.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(accessoryLeftIcon).offset(5)
            make.right.equalTo(rightTextLabel).offset(5)
            make.centerY.equalTo(self)
            make.height.equalTo(34)
        }
        
    //    rightTextLabel
        
    }
//MARK: - public function and event
    internal func switchEditMode(editerMode:Bool, animate:Bool) {
        if animate {
            animateDuring = 0.3
        }
        else {
            animateDuring = 0.0
        }
        self.editerMode = editerMode
    }
    
    internal func checkButtonClicked() {
        if !self.selected {
            leftImageView.image = UIImage(named: "iconfont-check-selected")
            leftImageView.backgroundColor = UIColor.noteNormalColor()
            self.selected = true
        }
        else {
            leftImageView.image = UIImage(named: "iconfont-check-normal")
            leftImageView.backgroundColor = UIColor.clearColor()
            self.selected = false
        }
        self.mainTableDelegate?.selectedDidChanged!()
    }
}
