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
        
        
        // Do any additional setup after loading the view.
    }
    
    private func printUser() {
        print("user")
        print(user.get(.name))
        print(user.get(.level))
        print(user.get(.rank))
        print(user.get(.rankImg))
        print(user.get(.levelFrame))
        print(user.get(.star))
        print(user.get(.quickWins))
        print(user.get(.quickLost))
        print(user.get(.quickPlayed))
        print(user.get(.quickPlayTime))
        print(user.get(.competitiveWins))
        print(user.get(.competitiveLost))
        print(user.get(.competitivePlayed))
        print(user.get(.competitivePlaytime))
        print(user.get(.avatar))
    }
    
    private func printAllHeroes() {
        print("all heroes")
        print(allHeroes.get(.cards))
        print(allHeroes.get(.damagaeDoneAverage))
        print(allHeroes.get(. damageDone ))
        print(allHeroes.get(.damageDoneMostInGame ))
        print(allHeroes.get(.deaths ))
        print(allHeroes.get(.deathsAverage ))
        print(allHeroes.get(.defensiveAssistsAverage ))


        

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
