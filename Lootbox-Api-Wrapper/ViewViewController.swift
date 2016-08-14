//
//  ViewViewController.swift
//  Lootbox-Api-Wrapper
//
//  Created by Matthew Rocco on 8/13/16.
//  Copyright © 2016 Matthew Rocco. All rights reserved.
//

import UIKit

class ViewViewController: UIViewController {
    var user : User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        user = User(ID: "roclbster504", platform: .Psn, region: .Us) { (success, error) in
            print(success)
            print(error)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
