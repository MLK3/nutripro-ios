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
        dayResumeNav.tabBarItem = UITabBarItem.init(title: nil, image: UIImage.init(named: "historico"), selectedImage: UIImage.init(named: "historicov"));
        dayResumeNav.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0);
        
        let analysedPicture = AnalysedPictureViewController(nibName:"AnalysedPictureViewController", bundle:nil);
        let analysedPictureNav = UINavigationController(rootViewController: analysedPicture);
        analysedPictureNav.navigationBar.isTranslucent = false;
        analysedPictureNav.navigationBar.tintColor = Colors.primaryColor();
        analysedPictureNav.navigationBar.barTintColor = Colors.primaryColor();
        analysedPictureNav.navigationBar.barStyle = UIBarStyle.blackOpaque;
        analysedPictureNav.tabBarItem = UITabBarItem.init(title: nil, image: UIImage.init(named: "prato"), selectedImage: UIImage.init(named: "pratov"));
        analysedPictureNav.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0);
        
        let profile = ProfileViewController(nibName:"ProfileViewController", bundle:nil);
        let profileNav = UINavigationController(rootViewController: profile);
        profileNav.navigationBar.isTranslucent = false;
        profileNav.navigationBar.tintColor = Colors.primaryColor();
        profileNav.navigationBar.barTintColor = Colors.primaryColor();
        profileNav.navigationBar.barStyle = UIBarStyle.blackOpaque;
        profileNav.tabBarItem = UITabBarItem.init(title: nil, image: UIImage.init(named: "perfil"), selectedImage: UIImage.init(named: "perfilv"));
        profileNav.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0);

        
        instance.viewControllers = [dayResumeNav, analysedPictureNav, profileNav];
        instance.selectedIndex = 0;
        
        return instance;
    }

}
