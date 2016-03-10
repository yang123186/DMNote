//
//  DMSuperNavigation.swift
//  DMNote
//
//  Created by 杨容清 on 16/3/10.
//  Copyright © 2016年 杨容清. All rights reserved.
//

import UIKit

class DMSuperNavigationController: UINavigationController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nil, bundle: nil)
        self.navigationBar.setBackgroundImage(UIImage(named: "bg_note"), forBarMetrics: .Default)
    }
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
}
