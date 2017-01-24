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
    
    @IBOutlet weak var carbsBar:UIView!;
    @IBOutlet weak var carbsBarContainer:UIView!;
    @IBOutlet weak var carbsBarMin:UIView!;
    
    @IBOutlet weak var proteinBar:UIView!;
    @IBOutlet weak var proteinBarContainer:UIView!;
    @IBOutlet weak var proteinBarMin:UIView!;
    
    @IBOutlet weak var totalFatBar:UIView!;
    @IBOutlet weak var totalFatBarContainer:UIView!;
    @IBOutlet weak var totalFatBarMin:UIView!;
    
    @IBOutlet weak var satFatBar:UIView!;
    @IBOutlet weak var satFatBarContainer:UIView!;
    @IBOutlet weak var satFatBarMin:UIView!;
    
    @IBOutlet weak var fiberBar:UIView!;
    @IBOutlet weak var fiberBarContainer:UIView!;
    @IBOutlet weak var fiberBarMin:UIView!;
    
    @IBOutlet weak var sodiumBar:UIView!;
    @IBOutlet weak var sodiumBarContainer:UIView!;
    @IBOutlet weak var sodiumBarMin:UIView!;

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.setNeedsLayout();
        view.layoutIfNeeded();
        
        dateBtn.layer.borderWidth = 1.0;
        dateBtn.layer.borderColor = Colors.primaryColor().cgColor;
        
        WebService.getWeekMeal(firstDate: "12122016", serviceBlock:{(result:NSDictionary) ->Void in
            print(result);
            
        });
        
        
        let energeticValueWidthConstraint = NSLayoutConstraint(item: energeticValueBar, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: energeticValueBarContainer, attribute: NSLayoutAttribute.width, multiplier: 10/150, constant: 0);
        let energeticValueMinConstraint = NSLayoutConstraint(item: energeticValueBarMin, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: energeticValueBarContainer, attribute: NSLayoutAttribute.centerX, multiplier: 70/75, constant: 0);
        
        let carbsWidthConstraint = NSLayoutConstraint(item: carbsBar, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: carbsBarContainer, attribute: NSLayoutAttribute.width, multiplier: 20/150, constant: 0);
        let carbsMinConstraint = NSLayoutConstraint(item: carbsBarMin, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: carbsBarContainer, attribute: NSLayoutAttribute.centerX, multiplier: 60/75, constant: 0);
        
        let proteinWidthConstraint = NSLayoutConstraint(item: proteinBar, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: proteinBarContainer, attribute: NSLayoutAttribute.width, multiplier: 30/150, constant: 0);
        let proteinMinConstraint = NSLayoutConstraint(item: proteinBarMin, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: proteinBarContainer, attribute: NSLayoutAttribute.centerX, multiplier: 50/75, constant: 0);
        
        let totalFatWidthConstraint = NSLayoutConstraint(item: totalFatBar, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: totalFatBarContainer, attribute: NSLayoutAttribute.width, multiplier: 40/150, constant: 0);
        let totalFatMinConstraint = NSLayoutConstraint(item: totalFatBarMin, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: totalFatBarContainer, attribute: NSLayoutAttribute.centerX, multiplier: 40/75, constant: 0);
        
        let satFatWidthConstraint = NSLayoutConstraint(item: satFatBar, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: satFatBarContainer, attribute: NSLayoutAttribute.width, multiplier: 50/150, constant: 0);
        let satFatMinConstraint = NSLayoutConstraint(item: satFatBarMin, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: satFatBarContainer, attribute: NSLayoutAttribute.centerX, multiplier: 30/75, constant: 0);
        
        let fiberWidthConstraint = NSLayoutConstraint(item: fiberBar, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: fiberBarContainer, attribute: NSLayoutAttribute.width, multiplier: 60/150, constant: 0);
        let fiberMinConstraint = NSLayoutConstraint(item: fiberBarMin, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: fiberBarContainer, attribute: NSLayoutAttribute.centerX, multiplier: 20/75, constant: 0);
        
        let sodiumWidthConstraint = NSLayoutConstraint(item: sodiumBar, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: sodiumBarContainer, attribute: NSLayoutAttribute.width, multiplier: 70/150, constant: 0);
        let sodiumMinConstraint = NSLayoutConstraint(item: sodiumBarMin, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: sodiumBarContainer, attribute: NSLayoutAttribute.centerX, multiplier: 10/75, constant: 0);
        
        NSLayoutConstraint.activate([energeticValueWidthConstraint, energeticValueMinConstraint, carbsWidthConstraint, carbsMinConstraint, proteinWidthConstraint, proteinMinConstraint, totalFatWidthConstraint, totalFatMinConstraint, satFatWidthConstraint, satFatMinConstraint, fiberWidthConstraint, fiberMinConstraint, sodiumWidthConstraint, sodiumMinConstraint]);
        
    }

}
