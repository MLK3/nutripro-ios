//
//  SugestedDietViewController.swift
//  nutripro
//
//  Created by Rafael Brandão on 02/11/16.
//  Copyright © 2016 oddsix. All rights reserved.
//

import UIKit

class SugestedDietViewController: UIViewController {
    
    @IBOutlet weak var sugestedDietLabel:UILabel!;
    
    @IBOutlet weak var energeticValueView:UIView!;
    @IBOutlet weak var energeticValueTitleLabel:UILabel!;
    @IBOutlet weak var energeticValueRangeLabel:UILabel!;
    
    @IBOutlet weak var carbsView:UIView!;
    @IBOutlet weak var carbsTitleLabel:UILabel!;
    @IBOutlet weak var carbsRangeLabel:UILabel!;
    
    @IBOutlet weak var proteinView:UIView!;
    @IBOutlet weak var proteinTitleLabel:UILabel!;
    @IBOutlet weak var proteinRangeLabel:UILabel!;
    
    @IBOutlet weak var totalFatView:UIView!;
    @IBOutlet weak var totalFatTitleLabel:UILabel!;
    @IBOutlet weak var totalFatRangeLabel:UILabel!;
    
    @IBOutlet weak var satFatView:UIView!;
    @IBOutlet weak var satFatTitleLabel:UILabel!;
    @IBOutlet weak var satFatRangeLabel:UILabel!;
    
    @IBOutlet weak var fiberView:UIView!;
    @IBOutlet weak var fiberTitleLabel:UILabel!;
    @IBOutlet weak var fiberRangeLabel:UILabel!;
    
    @IBOutlet weak var sodiumView:UIView!;
    @IBOutlet weak var sodiumTitleLabel:UILabel!;
    @IBOutlet weak var sodiumRangeLabel:UILabel!;
    
    @IBOutlet weak var editBtn:UIButton!;
    @IBOutlet weak var concludeBtn:UIButton!;
    

    override func viewDidLoad() {
        super.viewDidLoad();
        
        let grayColor = UIColor(red:93/255, green:93/255, blue:93/255, alpha:0.2);
        
        sugestedDietLabel.text = "Dieta diária sugerida:";
        sugestedDietLabel.textColor = Colors.primaryColor();
        
        let labelfontSize = 13;
        
        energeticValueView.backgroundColor = grayColor;
        carbsView.backgroundColor = grayColor;
        proteinView.backgroundColor = grayColor;
        totalFatView.backgroundColor = grayColor;
        satFatView.backgroundColor = grayColor;
        fiberView.backgroundColor = grayColor;
        sodiumView.backgroundColor = grayColor;
        
        energeticValueTitleLabel.text = "Valor Energético";
        carbsTitleLabel.text = "Carboidratos";
        proteinTitleLabel.text = "Proteínas";
        totalFatTitleLabel.text = "Gorduras Totais";
        satFatTitleLabel.text = "Gorduras Saturadas";
        fiberTitleLabel.text = "Fibre Alimentar";
        sodiumTitleLabel.text = "Sódio";
        
        energeticValueRangeLabel.text = "de {min} a {max} {unit}";
        carbsRangeLabel.text = "de {min} a {max} {unit}";
        proteinRangeLabel.text = "de {min} a {max} {unit}";
        totalFatRangeLabel.text = "de {min} a {max} {unit}";
        satFatRangeLabel.text = "de {min} a {max} {unit}";
        fiberRangeLabel.text = "de {min} a {max} {unit}";
        sodiumRangeLabel.text = "de {min} a {max} {unit}";
        
        energeticValueRangeLabel.textColor = Colors.primaryColor();
        carbsRangeLabel.textColor = Colors.primaryColor();
        proteinRangeLabel.textColor = Colors.primaryColor();
        totalFatRangeLabel.textColor = Colors.primaryColor();
        satFatRangeLabel.textColor = Colors.primaryColor();
        fiberRangeLabel.textColor = Colors.primaryColor();
        sodiumRangeLabel.textColor = Colors.primaryColor();
        
        energeticValueTitleLabel.font = energeticValueRangeLabel.font.withSize(CGFloat(labelfontSize));
        carbsTitleLabel.font = carbsRangeLabel.font.withSize(CGFloat(labelfontSize));
        proteinTitleLabel.font = proteinRangeLabel.font.withSize(CGFloat(labelfontSize));
        totalFatTitleLabel.font = totalFatRangeLabel.font.withSize(CGFloat(labelfontSize));
        satFatTitleLabel.font = satFatRangeLabel.font.withSize(CGFloat(labelfontSize));
        fiberTitleLabel.font = fiberRangeLabel.font.withSize(CGFloat(labelfontSize));
        sodiumTitleLabel.font = sodiumRangeLabel.font.withSize(CGFloat(labelfontSize));
        energeticValueRangeLabel.font = energeticValueRangeLabel.font.withSize(CGFloat(labelfontSize));
        carbsRangeLabel.font = carbsRangeLabel.font.withSize(CGFloat(labelfontSize));
        proteinRangeLabel.font = proteinRangeLabel.font.withSize(CGFloat(labelfontSize));
        totalFatRangeLabel.font = totalFatRangeLabel.font.withSize(CGFloat(labelfontSize));
        satFatRangeLabel.font = satFatRangeLabel.font.withSize(CGFloat(labelfontSize));
        fiberRangeLabel.font = fiberRangeLabel.font.withSize(CGFloat(labelfontSize));
        sodiumRangeLabel.font = sodiumRangeLabel.font.withSize(CGFloat(labelfontSize));
        
        editBtn.backgroundColor = Colors.primaryColor();
        editBtn.setTitle("EDITAR", for: editBtn.state);
        editBtn.setTitleColor(Colors.white, for: editBtn.state);
        
        concludeBtn.backgroundColor = Colors.primaryColor();
        concludeBtn.setTitle("CONCLUIR", for: concludeBtn.state);
        concludeBtn.setTitleColor(Colors.white, for: concludeBtn.state);
    }
    
    @IBAction func conclude(){
        let tabBarViewController = TabBarViewController.initTabs();
        let navController = UINavigationController(rootViewController: tabBarViewController)
        self.present(navController, animated: true, completion: nil)
    }
}
