//
//  ServiceRequest.swift
//  nutripro
//
//  Created by Rafael Brandão on 23/01/17.
//  Copyright © 2017 oddsix. All rights reserved.
//

import UIKit

typealias ASServiceBlock = (NSDictionary) -> Void;

class ServiceRequest: NSObject {
    
    static func requestWithURL(url:String, method:String, body:NSDictionary?) -> NSMutableURLRequest{
        let request = NSMutableURLRequest.init(url: URL.init(string: url)!, cachePolicy: NSURLRequest.CachePolicy.useProtocolCachePolicy, timeoutInterval: 60.0);
        request.addValue("application/json", forHTTPHeaderField: "Content-Type");
        
        if((body) != nil){
            do{
                let data = try JSONSerialization.data(withJSONObject: body!, options: JSONSerialization.WritingOptions(rawValue: 0));
                
                request.httpBody = data;
            }catch{
                
            }
        }
        
        request.httpMethod = method;
        
        return request;
    }
    
    static func dispatchService(serviceRequest:URLRequest, serviceBlock: @escaping ASServiceBlock) -> Void{
        DispatchQueue.global(qos: .background).async {
            
            var responseCode: URLResponse?
            do{
                let responseData = try NSURLConnection.sendSynchronousRequest(serviceRequest, returning: &responseCode);
                
                DispatchQueue.main.async {
                    do{
                        let result = try JSONSerialization.jsonObject(with: responseData, options: JSONSerialization.ReadingOptions.allowFragments);
                        
                        serviceBlock(result as! NSDictionary);
                    }catch (let errorResult){
                        let result = ["error": errorResult];
                        serviceBlock(result as NSDictionary);
                    }
                }
            } catch (let errorResponse){
                print(errorResponse);
                let result = NSDictionary.init();
                serviceBlock(result);
            }
        }
    }

}
