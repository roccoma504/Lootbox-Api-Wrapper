//
//  ViewViewController.swift
//  Lootbox-Api-Wrapper
//
//  Created by Matthew Rocco on 8/13/16.
//  Copyright © 2016 Matthew Rocco. All rights reserved.
//

import UIKit

class ViewViewController: UIViewController {
    var heroSuccess : Hero!
    
    
    var ID = "roclobster504"
    let platform = PlatformType.Psn
    let region = RegionType.Us
    let hero = Heroes.Hanzo
    let mode = ModeType.Quick
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        heroSuccess = Hero(ID: ID, platform: platform, region: region, mode: mode, hero: hero) { (success, error) in
            print(success)
            print(error)

            }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
