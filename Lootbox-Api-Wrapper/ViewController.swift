//
//  ViewController.swift
//  Lootbox-Api-Wrapper
//
//  Created by Matthew Rocco on 8/11/16.
//  Copyright © 2016 Matthew Rocco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let userID = "roclobster504"
        let platform : PlatformType = .psn
        let region : RegionType = .us
        
        var rURL = String(URLUtilities.heroURL(userID, platform: platform, region: region,mode: .competitive,hero: .Hanzo))
        var compURL = "https://api.lootbox.eu/psn/us/roclobster504/competitive-play/hanzo"
        print(rURL)
        print (compURL)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

