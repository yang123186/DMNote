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
        return DMToolBar(frame: CGRect(x: 0, y: SCREENHEIGHT - 44 - NAVBAR_DEFAULT_HEIGHT, width: SCREENWIDTH, height: 44))
    }()
    
    lazy var tableView:UITableView = {
        let tableView = UITableView(frame: self.view.frame)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: mainCellIdentifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
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
        return cell!
    }
    
}
