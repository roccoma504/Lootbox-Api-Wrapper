//
//  JSONUtilities.swift
//  HeroWatch
//
//  Created by Matthew Rocco on 7/19/16.
//  Copyright © 2016 Matthew Rocco. All rights reserved.
//

import UIKit

class JSONUtilities {
    
    /** Downloads the data from the URL.
     - Parameters:
     - url - URL where we want to download the image
     */
    private static func getDataFromUrl(url:NSURL,
                                completion: ((data: NSData?, response: NSURLResponse?, error: NSError? ) -> Void)) {
        NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in
            completion(data: data, response: response, error: error)
            }.resume()
    }
    
    /**
     Downloads an image from a given URL.
     - Parameters:
     - url - URL where we want to download the image
     */
    static func downloadImage(url : NSURL, completion: (image : UIImage, error: NSError?) -> Void) -> () {
        getDataFromUrl(url) { (data, response, error)  in
            guard let data = data where error == nil else {
                return }
            completion(image: UIImage(data: data)!, error: error)
        }
    }

    
    static func retrieve(url : NSURL, completion: (json: [String : AnyObject]!, error: NSError?) -> ()){
        var retrievedData : [String : AnyObject]!
        
        let request = NSMutableURLRequest(URL: url)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request) { data, response, error in
        
            if error != nil {
                let error = NSError(domain: "Failed to retrieve data. Please check your connection.", code: 400, userInfo: nil)
                completion(json: retrievedData, error: error);

            }
            else {
                do {
                    retrievedData = try NSJSONSerialization.JSONObjectWithData(data!,options: []) as! [String : AnyObject]
                    if retrievedData ["error"] != nil {
                        let error = NSError(domain: retrievedData ["error"] as! String, code: 100, userInfo: nil)
                        completion(json: [:], error: error);
                    }
                }
                catch {
                    let error = NSError(domain: "Failed to retrieve data.", code: 101, userInfo: nil)
                    completion(json: [:], error: error);
                }
            }
            completion(json: retrievedData, error: error);
        }
        task.resume()
    }
}
