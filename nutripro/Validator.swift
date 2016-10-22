
//
//  Validator.swift
//  nutripro
//
//  Created by Rafael Brandão on 22/10/16.
//  Copyright © 2016 oddsix. All rights reserved.
//

import UIKit

class Validator: NSObject {
    
    static func validateLogin(itSelf:AnyObject, email:String?, password:String?) -> Bool{
        if((email?.characters.count)! > 0 && (password?.characters.count)! > 0){
            let emailRegex = "^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
            let test = NSPredicate(format: "SELF MATCHES %@", emailRegex);
            if(test.evaluate(with: email)){
                if((password?.characters.count)! < 6){
                    makeAlert(itSelf: itSelf, title: "A senha precisa ter 6 ou mais dígitos");
                    return false;
                } else {
                    return true;
                }
            } else {
                makeAlert(itSelf: itSelf, title: "Por favor utilize um email válido");
                return false;
            }
        } else {
            makeAlert(itSelf: itSelf, title: "Por favor preencha todos os campos");
            return false;
        }
    }
    
    static func validateSignIn(itSelf:AnyObject, name:NSString, email:NSString) -> Bool {
        return true;
    }
    
//    +(void)validateSignIn:(NSString*)cpf nome:(NSString*)nome email:(NSString*)email endereco:(NSString*)endereco telefone:(NSString*)telefone password:(NSString*)password self:(id)itSelf navigationController:(UINavigationController*) navCtrl checkBox:(UIButton*)checkBox{
//    
//    if(cpf && nome && email && endereco && telefone && password && cpf.length > 0 && nome.length > 0 && email.length > 0 && endereco.length > 0 && telefone.length > 0 && password.length > 0){
//    NSString *regex = @"^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
//    NSPredicate *test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
//    if([test evaluateWithObject:email]){
//    if([checkBox isSelected]){
//    UIAlertController *alert = [UIAlertController
//    alertControllerWithTitle:@"Confirme sua senha"
//    message:nil
//    preferredStyle:UIAlertControllerStyleAlert];
//    
//    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField){textField.secureTextEntry = YES;}];
//    
//    UIAlertAction *okAction = [UIAlertAction
//    actionWithTitle:NSLocalizedString(@"CADASTRAR", @"OK action")
//    style:UIAlertActionStyleDefault
//    handler:^(UIAlertAction *action)
//    {
//    if ([password isEqualToString:alert.textFields.firstObject.text])
//    {
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Solicitação de cadastro enviado com sucesso! Aguarde um e-mail de conirmação."
//    message:nil
//    delegate:nil
//    cancelButtonTitle:@"OK"
//    otherButtonTitles:nil];
//    [alert show];
//    [navCtrl popViewControllerAnimated:YES];
//    }
//    else
//    {
//    UIAlertController *alertErr = [UIAlertController
//    alertControllerWithTitle:@"As senhas não conferem"
//    message:nil
//    preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
//    [alertErr addAction:ok];
//    [itSelf presentViewController:alertErr animated:YES completion:nil];
//    }
//    }];
//    okAction.enabled = true;
//    
//    [alert addAction:okAction];
//    
//    [itSelf presentViewController:alert animated:YES completion:nil];
//    } else {
//    UIAlertController *alertErr = [UIAlertController
//    alertControllerWithTitle:@"Por favor leia e aceite os termos de uso"
//    message:nil
//    preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
//    [alertErr addAction:ok];
//    [itSelf presentViewController:alertErr animated:YES completion:nil];
//    }
//    } else {
//    UIAlertController *alertErr = [UIAlertController
//    alertControllerWithTitle:@"Por favor utilize um email válido"
//    message:nil
//    preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
//    [alertErr addAction:ok];
//    [itSelf presentViewController:alertErr animated:YES completion:nil];
//    }
//    } else {
//    UIAlertController *alertErr = [UIAlertController
//    alertControllerWithTitle:@"Por favor preencha todos os campos"
//    message:nil
//    preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
//    [alertErr addAction:ok];
//    [itSelf presentViewController:alertErr animated:YES completion:nil];
//    }
    //    }
    
    static func makeAlert(itSelf:AnyObject, title:String) -> Void {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: UIAlertControllerStyle.alert);
        
        let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil);
        
        alert.addAction(ok);
        
        itSelf.present(alert, animated:true, completion:nil);
    }

}
