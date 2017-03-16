//
//  DayResumeViewController.swift
//  nutripro
//
//  Created by Rafael Brandão on 02/11/16.
//  Copyright © 2016 oddsix. All rights reserved.
//

import UIKit

class DayResumeViewController: UIViewController {
    
    @IBOutlet weak var dateBtn:UIButton!;
    
    @IBOutlet weak var energeticValueBar:UIView!;
    @IBOutlet weak var energeticValueBarContainer:UIView!;
    @IBOutlet weak var energeticValueBarMin:UIView!;
    @IBOutlet weak var energeticValueBarMax:UIView!;
    
    @IBOutlet weak var carbsBar:UIView!;
    @IBOutlet weak var carbsBarContainer:UIView!;
    @IBOutlet weak var carbsBarMin:UIView!;
    @IBOutlet weak var carbsBarMax:UIView!;
    
    @IBOutlet weak var proteinBar:UIView!;
    @IBOutlet weak var proteinBarContainer:UIView!;
    @IBOutlet weak var proteinBarMin:UIView!;
    @IBOutlet weak var proteinBarMax:UIView!;
    
    @IBOutlet weak var totalFatBar:UIView!;
    @IBOutlet weak var totalFatBarContainer:UIView!;
    @IBOutlet weak var totalFatBarMin:UIView!;
    @IBOutlet weak var totalFatBarMax:UIView!;
    
    @IBOutlet weak var satFatBar:UIView!;
    @IBOutlet weak var satFatBarContainer:UIView!;
    @IBOutlet weak var satFatBarMin:UIView!;
    @IBOutlet weak var satFatBarMax:UIView!;
    
    @IBOutlet weak var fiberBar:UIView!;
    @IBOutlet weak var fiberBarContainer:UIView!;
    @IBOutlet weak var fiberBarMin:UIView!;
    @IBOutlet weak var fiberBarMax:UIView!;
    
    @IBOutlet weak var sodiumBar:UIView!;
    @IBOutlet weak var sodiumBarContainer:UIView!;
    @IBOutlet weak var sodiumBarMin:UIView!;
    @IBOutlet weak var sodiumBarMax:UIView!;

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.setNeedsLayout();
        view.layoutIfNeeded();
        
        dateBtn.layer.borderWidth = 1.0;
        dateBtn.layer.borderColor = Colors.primaryColor().cgColor;
        
        let date = "15/11/2016";
        
//        WebService.getWeekMeal(firstDate: "12122016", serviceBlock:{(result:NSDictionary) ->Void in
//            print(result);
//            
//            let nutrients = result["nutrients"] as! NSArray;
//            
//            for nutrient in nutrients{
//                let nutrient = nutrient as! NSDictionary;
//                
//                if((nutrient["name"] as! String).isEqual("Carboidratos")){
//                    
//                }
//            }
//            
//        });

        WebService.getDiet(serviceBlock:{(result:NSDictionary) ->Void in
            print(result);
            
            let nutrients = result["nutrients"] as! NSArray;
            
            var carbsMinConstraint = NSLayoutConstraint.init();
            var energeticValueMinConstraint = NSLayoutConstraint.init();
            var proteinMinConstraint = NSLayoutConstraint.init();
            var totalFatMinConstraint = NSLayoutConstraint.init();
            var satFatMinConstraint = NSLayoutConstraint.init();
            var fiberMinConstraint = NSLayoutConstraint.init();
            var sodiumMinConstraint = NSLayoutConstraint.init();
            
            for nutrient in nutrients{
                let nutrient = nutrient as! NSDictionary;
                
                let max = nutrient["max"] as! Double;
                let min = nutrient["min"] as! Double;
                
                //Arruma os pontos de min
                if((nutrient["name"] as! String).isEqual("valor energético")){
                    
                    energeticValueMinConstraint = NSLayoutConstraint(item: self.energeticValueBarMin, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: self.energeticValueBarMax, attribute: NSLayoutAttribute.centerX, multiplier: CGFloat(min/max), constant: 0);
                    
                } else if((nutrient["name"] as! String).isEqual("carboidrato")){
                    
                    carbsMinConstraint = NSLayoutConstraint(item: self.carbsBarMin, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: self.carbsBarMax, attribute: NSLayoutAttribute.centerX, multiplier: CGFloat(min/max), constant: 0);
                    
                } else if((nutrient["name"] as! String).isEqual("proteina")){
                    
                    proteinMinConstraint = NSLayoutConstraint(item: self.proteinBarMin, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: self.proteinBarMax, attribute: NSLayoutAttribute.centerX, multiplier: CGFloat(min/max), constant: 0);
                    
                } else if((nutrient["name"] as! String).isEqual("gorduras totais")){
                    
                    totalFatMinConstraint = NSLayoutConstraint(item: self.totalFatBarMin, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: self.totalFatBarMax, attribute: NSLayoutAttribute.centerX, multiplier: CGFloat(min/max), constant: 0);
                    
                } else if((nutrient["name"] as! String).isEqual("gorduras saturadas")){
                    
                    satFatMinConstraint = NSLayoutConstraint(item: self.satFatBarMin, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: self.satFatBarMax, attribute: NSLayoutAttribute.centerX, multiplier: CGFloat(min/max), constant: 0);
                    
                } else if((nutrient["name"] as! String).isEqual("fibra alimentar")){
                    
                    fiberMinConstraint = NSLayoutConstraint(item: self.fiberBarMin, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: self.fiberBarMax, attribute: NSLayoutAttribute.centerX, multiplier: CGFloat(min/max), constant: 0);
                    
                } else if((nutrient["name"] as! String).isEqual("sodio")){
                    
                    sodiumMinConstraint = NSLayoutConstraint(item: self.sodiumBarMin, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: self.sodiumBarMax, attribute: NSLayoutAttribute.centerX, multiplier: CGFloat(min/max), constant: 0);
                    
                }
            }
            
            NSLayoutConstraint.activate([energeticValueMinConstraint, carbsMinConstraint, proteinMinConstraint, totalFatMinConstraint, satFatMinConstraint, fiberMinConstraint, sodiumMinConstraint]);
            
            WebService.getWeekMeal(firstDate: date, serviceBlock: {(result:NSDictionary) ->Void in
                
                print(result);
                
                let nutrientsDay = result["nutrients"] as! NSArray;
                
                var energeticValueWidthConstraint = NSLayoutConstraint(item: self.energeticValueBar, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: self.energeticValueBarContainer, attribute: NSLayoutAttribute.width, multiplier: 0, constant: 0);
                var carbsWidthConstraint = NSLayoutConstraint(item: self.carbsBar, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: self.carbsBarContainer, attribute: NSLayoutAttribute.width, multiplier: 0, constant: 0);
                var proteinWidthConstraint = NSLayoutConstraint(item: self.proteinBar, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: self.proteinBarContainer, attribute: NSLayoutAttribute.width, multiplier: 0, constant: 0);
                var totalFatWidthConstraint = NSLayoutConstraint(item: self.totalFatBar, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: self.totalFatBarContainer, attribute: NSLayoutAttribute.width, multiplier: 0, constant: 0);
                var satFatWidthConstraint = NSLayoutConstraint(item: self.satFatBar, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: self.satFatBarContainer, attribute: NSLayoutAttribute.width, multiplier: 0, constant: 0);
                var fiberWidthConstraint = NSLayoutConstraint(item: self.fiberBar, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: self.fiberBarContainer, attribute: NSLayoutAttribute.width, multiplier: 0, constant: 0);
                var sodiumWidthConstraint = NSLayoutConstraint(item: self.sodiumBar, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: self.sodiumBarContainer, attribute: NSLayoutAttribute.width, multiplier: 0, constant: 0);
                
                for nutrient in nutrientsDay{
                    let nutrient = nutrient as! NSDictionary;
                    
                    let max = nutrient["max"] as! Double;
                    
                    for quantitie in nutrient["quantities"] as! NSArray{
                        let quantitie = quantitie as! NSDictionary;
                        
                        let sum = quantitie["sum"] as! Double;
                        
                        var multiplier = CGFloat.init();
                        
                        if(sum >= max*1.5){
                            multiplier = 1;
                        } else {
                            multiplier = CGFloat(sum / (max * 1.5));
                        }
                        
                        if((quantitie["date"] as! String).isEqual(date)){
                            //Arruma as barras dos itens
                            if((nutrient["name"] as! String).isEqual("Valor Energético")){
                                
                               energeticValueWidthConstraint = NSLayoutConstraint(item: self.energeticValueBar, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: self.energeticValueBarContainer, attribute: NSLayoutAttribute.width, multiplier: multiplier, constant: 0);
                                
                            } else if((nutrient["name"] as! String).isEqual("Carboidratos")){
                                
                                carbsWidthConstraint = NSLayoutConstraint(item: self.carbsBar, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: self.carbsBarContainer, attribute: NSLayoutAttribute.width, multiplier: multiplier, constant: 0);
                                
                            } else if((nutrient["name"] as! String).isEqual("proteina")){
                                
                                proteinWidthConstraint = NSLayoutConstraint(item: self.proteinBar, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: self.proteinBarContainer, attribute: NSLayoutAttribute.width, multiplier: multiplier, constant: 0);
                                
                            } else if((nutrient["name"] as! String).isEqual("gorduras totais")){
                                
                                totalFatWidthConstraint = NSLayoutConstraint(item: self.totalFatBar, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: self.totalFatBarContainer, attribute: NSLayoutAttribute.width, multiplier: multiplier, constant: 0);
                                
                            } else if((nutrient["name"] as! String).isEqual("gorduras saturadas")){
                                
                                satFatWidthConstraint = NSLayoutConstraint(item: self.satFatBar, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: self.satFatBarContainer, attribute: NSLayoutAttribute.width, multiplier: multiplier, constant: 0);
                                
                            } else if((nutrient["name"] as! String).isEqual("fibra alimentar")){
                                
                                fiberWidthConstraint = NSLayoutConstraint(item: self.fiberBar, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: self.fiberBarContainer, attribute: NSLayoutAttribute.width, multiplier: multiplier, constant: 0);
                                
                            } else if((nutrient["name"] as! String).isEqual("sodio")){
                                
                                sodiumWidthConstraint = NSLayoutConstraint(item: self.sodiumBar, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: self.sodiumBarContainer, attribute: NSLayoutAttribute.width, multiplier: multiplier, constant: 0);
                                
                            }

                        }
                    }
                    
                    NSLayoutConstraint.activate([energeticValueWidthConstraint, carbsWidthConstraint, proteinWidthConstraint, totalFatWidthConstraint, satFatWidthConstraint, fiberWidthConstraint, sodiumWidthConstraint]);
                }
            })
            
        });
        
    }

}
