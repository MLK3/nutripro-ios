//
//  TabBarViewController.swift
//  nutripro
//
//  Created by Rafael Brandão on 02/11/16.
//  Copyright © 2016 oddsix. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    static func initTabs() -> TabBarViewController {
        let instance = TabBarViewController();
        instance.tabBar.tintColor = Colors.white;
        instance.tabBar.barTintColor = Colors.primaryColor();
        instance.tabBar.isTranslucent = false;
        
        let dayResume = DayResumeViewController(nibName:"DayResumeViewController", bundle:nil);
        let dayResumeNav = UINavigationController(rootViewController: dayResume);
        dayResumeNav.navigationBar.isTranslucent = false;
        dayResumeNav.navigationBar.tintColor = Colors.primaryColor();
        dayResumeNav.navigationBar.barTintColor = Colors.primaryColor();
        dayResumeNav.navigationBar.barStyle = UIBarStyle.blackOpaque;
//        [mapNav.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UserConfig shared].textColor}];

        
        instance.viewControllers = [dayResumeNav];
        instance.selectedIndex = 0;
        
        return instance;
    }

}
