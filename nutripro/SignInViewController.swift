//
//  SignInViewController.swift
//  nutripro
//
//  Created by Rafael Brandão on 15/10/16.
//  Copyright © 2016 oddsix. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate, UIActionSheetDelegate {
    
    @IBOutlet weak var SignInLabel:UILabel!;
    @IBOutlet weak var nameTextField:UITextField!;
    @IBOutlet weak var emailTextField:UITextField!;
    @IBOutlet weak var sexTextField:UITextField!;
    @IBOutlet weak var sexBtn:UIButton!;
    @IBOutlet weak var passwordTextField:UITextField!;
    @IBOutlet weak var ageTextField:UITextField!;
    @IBOutlet weak var weigthTextField:UITextField!;
    @IBOutlet weak var heightTextField:UITextField!;
    @IBOutlet weak var saveBtn:UIButton!;

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
        sexBtn.setTitle(String.localizedStringWithFormat("Sexo", "sexPlaceholder"), for: sexBtn.state);
        sexBtn.tintColor = Colors.lightGray;
        ageTextField.placeholder = String.localizedStringWithFormat("Idade", "agePlaceholder");
        weigthTextField.placeholder = String.localizedStringWithFormat("Peso", "weigthPlaceholder");
        heightTextField.placeholder = String.localizedStringWithFormat("Altura", "heightPlaceholder");
        
        nameTextField.delegate = self;
        emailTextField.delegate = self;
        passwordTextField.delegate = self;
        ageTextField.delegate = self;
        weigthTextField.delegate = self;
        heightTextField.delegate = self;
        
        nameTextField.tag = 1;
        emailTextField.tag = nameTextField.tag + 1;
        passwordTextField.tag = emailTextField.tag + 1;
        ageTextField.tag = passwordTextField.tag + 1;
        weigthTextField.tag = ageTextField.tag + 1;
        heightTextField.tag = weigthTextField.tag + 1;
        
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
        if(nextTag == 4){
            textField.resignFirstResponder();
            selectSex();
        } else if ((nextResponder) != nil) {
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
    
    @IBAction func selectSex(){
        sexTextField.becomeFirstResponder();
        sexTextField.resignFirstResponder();
        
        let actionSheet = UIActionSheet.init(title: "Selecione seu sexo", delegate: self, cancelButtonTitle: nil, destructiveButtonTitle: "Cancelar", otherButtonTitles: "Masculino", "Feminino");
        actionSheet.show(in: self.view);
    }
    
    func actionSheet(_ actionSheet: UIActionSheet, clickedButtonAt buttonIndex: Int) {
        if(actionSheet.buttonTitle(at: buttonIndex) != "Cancelar"){
            sexBtn.tintColor = Colors.black
            sexBtn.setTitle(actionSheet.buttonTitle(at: buttonIndex), for: sexBtn.state);
            ageTextField.becomeFirstResponder();
        }
    }
    
}
