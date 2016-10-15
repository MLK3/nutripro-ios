//
//  LoginViewController.swift
//  nutripro
//
//  Created by Rafael Brandão on 15/10/16.
//  Copyright © 2016 oddsix. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var emailTextField:UITextField!;
    @IBOutlet var passwordTextField:UITextField!;
    @IBOutlet var loginBtn:UIButton!;
    @IBOutlet var signInView:UIView!;
    @IBOutlet var signInLabel:UILabel!;
    @IBOutlet var signInBtn:UIButton!;

    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.placeholder = NSString.localizedStringWithFormat("E-mail", "Email") as String;
        passwordTextField.placeholder = NSString.localizedStringWithFormat("Senha", "Password") as String;
        
        loginBtn.setTitle(NSString.localizedStringWithFormat("ENTRAR", "Login") as String, for: loginBtn.state) ;
        loginBtn.setTitleColor(Colors.white, for: loginBtn.state);
        loginBtn.backgroundColor = Colors.primaryColor();
        
        signInLabel.text = NSString.localizedStringWithFormat("Ainda não tem uma conta? ", "signInLabel") as String;
        signInBtn.setTitleColor(Colors.primaryColor(), for: signInBtn.state);
        signInBtn.setTitle(NSString.localizedStringWithFormat("Cadastre-se", "signInBtn") as String, for: signInBtn.state);
        setSignInSizes();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setSignInSizes() -> Void {
        signInLabel.sizeToFit();
        signInBtn.sizeToFit();
        signInBtn.frame = CGRect(x:0 , y:0, width:signInBtn.frame.width, height:signInLabel.frame.height);
        
        let textSize:CGFloat = signInLabel.frame.width + signInBtn.frame.width;
        
        signInLabel.frame.origin.x = (signInView.frame.width - textSize)/2;
        signInBtn.frame.origin.x = signInLabel.frame.origin.x + signInLabel.frame.width;
    }

}
