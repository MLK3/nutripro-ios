//
//  SignInViewController.swift
//  nutripro
//
//  Created by Rafael Brandão on 15/10/16.
//  Copyright © 2016 oddsix. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var SignInLabel:UILabel!;
    @IBOutlet var nameTextField:UITextField!;
    @IBOutlet var emailTextField:UITextField!;
    @IBOutlet var sexTextField:UITextField!;
    @IBOutlet var passwordTextField:UITextField!;
    @IBOutlet var ageTextField:UITextField!;
    @IBOutlet var weigthTextField:UITextField!;
    @IBOutlet var heightTextField:UITextField!;
    @IBOutlet var saveBtn:UIButton!;

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.topItem?.title = "";
        UINavigationBar.appearance().tintColor = Colors.primaryColor();
        navigationController?.navigationBar.setBackgroundImage(UIImage.init(), for: UIBarMetrics.default);
        navigationController?.navigationBar.shadowImage = UIImage.init();
        navigationController?.navigationBar.isTranslucent = true;
        navigationController?.view.backgroundColor = UIColor.clear;
        navigationController?.navigationBar.backgroundColor = UIColor.clear;
        
        navigationController?.setNavigationBarHidden(false, animated: true);
        
        SignInLabel.text = String.localizedStringWithFormat("Cadastro de Informações", "CadastroLabel");
        SignInLabel.textColor = Colors.primaryColor();
        
        nameTextField.placeholder = String.localizedStringWithFormat("Nome", "namePlaceholder");
        emailTextField.placeholder = String.localizedStringWithFormat("Email", "emailPlaceholder");
        passwordTextField.placeholder = String.localizedStringWithFormat("Senha", "passwordPlaceholder");
        sexTextField.placeholder = String.localizedStringWithFormat("Sexo", "sexPlaceholder");
        ageTextField.placeholder = String.localizedStringWithFormat("Idade", "agePlaceholder");
        weigthTextField.placeholder = String.localizedStringWithFormat("Peso", "weigthPlaceholder");
        heightTextField.placeholder = String.localizedStringWithFormat("Altura", "heightPlaceholder");
        
        nameTextField.delegate = self;
        emailTextField.delegate = self;
        passwordTextField.delegate = self;
        sexTextField.delegate = self;
        ageTextField.delegate = self;
        weigthTextField.delegate = self;
        heightTextField.delegate = self;
        
        nameTextField.tag = 1;
        emailTextField.tag = 2;
        passwordTextField.tag = 3;
        sexTextField.tag = 4;
        ageTextField.tag = 5;
        weigthTextField.tag = 6;
        heightTextField.tag = 7;
        
        saveBtn.setTitle(String.localizedStringWithFormat("SALVAR", "sabeBtn"), for: saveBtn.state);
        saveBtn.setTitleColor(Colors.white, for: saveBtn.state);
        saveBtn.backgroundColor = Colors.primaryColor();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
//MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1;
        
        let nextResponder = textField.superview?.viewWithTag(nextTag);
        if ((nextResponder) != nil) {
            nextResponder?.becomeFirstResponder();
        } else {
            textField.resignFirstResponder();
        }
        return false;
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        IHKeyboardAvoiding.setAvoiding(self.view, withTriggerView:textField);
        
        return true;
    }
    
}
