//
//  ViewController.swift
//  DMNote
//
//  Created by 杨容清 on 16/3/8.
//  Copyright © 2016年 杨容清. All rights reserved.
//

import UIKit

let mainCellIdentifier  =   "DMDirIdentifier"

class DMMainController: UIViewController {
    
    lazy var toolBar:DMToolBar = {
        var toolbar = DMToolBar(frame: CGRect(x: 0, y: SCREENHEIGHT - 44 - NAVBAR_DEFAULT_HEIGHT, width: SCREENWIDTH - 10, height: 44))
        self.toolBarTextLabel.textColor = RGBCOLOR(255, g: 170, b: 0)
        self.toolBarTextLabel.text = "新建文件夹"
        self.toolBarTextLabel.textAlignment = .Right
        toolbar.addSubview(self.toolBarTextLabel)
        return toolbar
    }()
    
    lazy var toolBarTextLabel:UILabel = UILabel(frame: CGRect(x: SCREENWIDTH - 100, y: 0, width: 90, height: 44))
    
    lazy var tableView:UITableView = {
        let tableView = UITableView(frame: self.view.frame)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClass(DMMainTableViewCell.self, forCellReuseIdentifier: mainCellIdentifier)
        var headerView = UIView(frame: CGRect(x: 0, y: 0, width: SCREENWIDTH, height: 38))
        var label = UILabel(frame: CGRect(x: 10, y: 0, width: SCREENWIDTH - 10, height: 37))
        label.font = UIFont.systemFontOfSize(15)
        label.text = "我的 IPHONE 上"
        label.textColor = RGBCOLOR(123, g: 123, b: 123)
        var lineView = UIView(frame: CGRect(x: 0, y: 37.5, width: SCREENWIDTH, height: 0.5))
        lineView.backgroundColor = RGBCOLOR(177, g: 177, b: 177)
        
        headerView.addSubview(label)
        headerView.addSubview(lineView)
        
        tableView.tableFooterView = UIView()
        tableView.tableHeaderView = headerView
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "文件夹"
        let image = UIImage(named: "bg_note")
        self.view.layer.contents = image!.CGImage    // 如果需要背景透明加上下面这句
        self.view.layer.backgroundColor = UIColor.clearColor().CGColor
        self.tableView.layer.contents = image!.CGImage
        self.tableView.layer.backgroundColor = UIColor.clearColor().CGColor
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "编辑", style: .Plain, target: self, action: Selector("editerClicked"))
        self.navigationItem.rightBarButtonItem?.tintColor = RGBCOLOR(255, g: 170, b: 0)
        
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.addSubview(self.tableView)
        self.view.addSubview(self.toolBar)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func editerClicked() {
        print("editer is Clicked")
        for var i = 0; i < 10; i++ {
            let index = NSIndexPath(forRow: i, inSection: 0)
            let cell = tableView.cellForRowAtIndexPath(index) as! DMMainTableViewCell
            cell.switchEditMode(!cell.editerMode, animate: true)
            if cell.editerMode {
                toolBarTextLabel.text = "删除"
            }
            else {
                toolBarTextLabel.text = "新建文件夹"
            }
        }
        
    }
    
    func mkdirClicked() {
        print("mkdir is clicked")
    }
}

extension DMMainController:UITableViewDelegate {
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44.0
    }
}

extension DMMainController:UITableViewDataSource {

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(mainCellIdentifier)
        cell?.backgroundColor = UIColor.clearColor()
        cell?.selectionStyle = .Gray
        cell?.editingAccessoryView?.tintColor = RGBCOLOR(255, g: 170, b: 0)
        return cell!
    }
}
