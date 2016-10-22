//
//  LoginViewController.swift
//  nutripro
//
//  Created by Rafael Brandão on 15/10/16.
//  Copyright © 2016 oddsix. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var emailTextField:UITextField!;
    @IBOutlet var passwordTextField:UITextField!;
    @IBOutlet var loginBtn:UIButton!;
    @IBOutlet var signInView:UIView!;
    @IBOutlet var signInLabel:UILabel!;
    @IBOutlet var signInBtn:UIButton!;
    
    @IBAction func sigIn(){
        let view = SignInViewController(nibName: "SignInViewController", bundle: nil);
        navigationController?.pushViewController(view, animated: true);
    }
    
    @IBAction func login(){
        print("%@" ,Validator.validateLogin(itSelf: self, email: emailTextField.text, password: passwordTextField.text));
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: true);
        
        emailTextField.placeholder = String.localizedStringWithFormat("E-mail", "Email");
        passwordTextField.placeholder = String.localizedStringWithFormat("Senha", "Password");
        
        emailTextField.tag = 1;
        passwordTextField.tag = 2;
        
        emailTextField.delegate = self;
        passwordTextField.delegate = self;
        
        loginBtn.setTitle(String.localizedStringWithFormat("ENTRAR", "Login"), for: loginBtn.state) ;
        loginBtn.setTitleColor(Colors.white, for: loginBtn.state);
        loginBtn.backgroundColor = Colors.primaryColor();
        
        signInLabel.text = String.localizedStringWithFormat("Ainda não tem uma conta? ", "signInLabel");
        
        signInBtn.setTitleColor(Colors.primaryColor(), for: signInBtn.state);
        signInBtn.setTitle(String.localizedStringWithFormat("Cadastre-se", "signInBtn"), for: signInBtn.state);
        setSignInSizes();
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        navigationController?.setNavigationBarHidden(true, animated: true);
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1;
        
        let nextResponder = textField.superview?.viewWithTag(nextTag);
        if ((nextResponder) != nil) {
            nextResponder?.becomeFirstResponder();
        } else {
            textField.resignFirstResponder();
            login();
        }
        return false;
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        IHKeyboardAvoiding.setAvoiding(self.view, withTriggerView:textField);
        
        return true;
    }
}
