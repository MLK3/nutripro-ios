//
//  WebService.swift
//  nutripro
//
//  Created by Rafael Brandão on 23/01/17.
//  Copyright © 2017 oddsix. All rights reserved.
//

import UIKit

class WebService: NSObject {
    
    static func getWeekMeal(firstDate:String, serviceBlock:@escaping ASServiceBlock) -> Void{
        let str = WebConstants.URL.appending(WebConstants.WEEK_MEAL).appending(firstDate);
        
        let request = ServiceRequest.requestWithURL(url: str, method: "GET", body: nil);
        
        ServiceRequest.dispatchService(serviceRequest: request as URLRequest, serviceBlock: serviceBlock);
    }
    
    static func getDiet(serviceBlock:@escaping ASServiceBlock) -> Void{
        let str = WebConstants.URL.appending(WebConstants.DIET);
        
        let request = ServiceRequest.requestWithURL(url: str, method: "GET", body: nil);
        
        ServiceRequest.dispatchService(serviceRequest: request as URLRequest, serviceBlock: serviceBlock);
    }

}
