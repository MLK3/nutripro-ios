//
//  ProfileViewController.swift
//  nutripro
//
//  Created by Rafael Brandão on 02/11/16.
//  Copyright © 2016 oddsix. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO: criar botão de logout
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "user_email")
        defaults.set(false, forKey: "is_logged")
        defaults.synchronize()
        let loginViewController = LoginViewController.init();
        let navController = UINavigationController(rootViewController: loginViewController)
        self.present(navController, animated: true, completion: nil)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
