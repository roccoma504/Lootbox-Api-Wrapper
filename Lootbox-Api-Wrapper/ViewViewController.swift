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
    var allHeroes : AllHeroes!
    var hero : Hero!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("loaded")
        
        user = User(ID: "roclobster504", platform: .psn, region: .us, completion: { (success, error) in
            if success {
                self.printUser()
            }
        })
        
        allHeroes = AllHeroes(ID: "roclobster504", platform: .psn, region: .us, mode: .quick, completion: { (success, error) in
                if success {
                    self.printAllHeroes()
                }
        })
        
        hero = Hero(ID: "roclobster504", platform: .psn, region: .us, mode: .quick, hero: .Hanzo, completion: { (success, error) in })
        // Do any additional setup after loading the view.
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
