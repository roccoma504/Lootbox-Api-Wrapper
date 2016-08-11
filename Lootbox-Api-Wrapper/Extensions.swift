//
//  Extensions.swift
//  Lootbox API Wrapper
//
//  Created by Matthew Rocco on 8/9/16.
//  Copyright © 2016 Matthew Rocco. All rights reserved.
//

import Foundation

extension String {
    /**
     Private function to replace strings
     
     - parameter string:      the source string to replace
     - parameter replacement: the string to replace with
     
     - returns: the source string replaced with the replacement
     */
    private func replace(string:String, replacement:String) -> String {
        return self.stringByReplacingOccurrencesOfString(string, withString: replacement, options: NSStringCompareOptions.LiteralSearch, range: nil)
    }
    
    /**
     Removes whitespace
     
     - returns: self, with whitespace removed
     */
    func removeWhitespace() -> String {
        return self.replace(" ", replacement: "")
    }
    
    /**
     Removes commas
     
     - returns: self, with commas removed
     */
    func removeComma() -> String {
        return self.replace(",", replacement: "")
    }
    
    /**
     Replaces hashes
     
     - returns: self, with hashes replaced with "-" for the API
     */
    func replaceHash() -> String {
        return self.replace("#", replacement: "-")
    }
    
    /**
     Removes dashes
     
     - returns: self, with "-" removed
     */
    func removeDash() -> String {
        return self.replace("-", replacement: " ")
    }
    
    /**
     Removes commas
     
     - returns: self, with commas removed
     */
    func removeColon() -> String {
        return self.replace(":", replacement: "")
    }

    /**
     Inserts a string into an already established string
     
     - parameter string: string to insert
     - parameter ind:    index to insert the string at
     
     - returns: The string with the input string added at the index
     */
    private func insert(string:String,ind:Int) -> String {
        return  String(self.characters.prefix(ind)) + string + String(self.characters.suffix(self.characters.count-ind))
    }
    
    /**
     Adds a comma for numerics
     
     - returns: The numeric with the comma added
     */
    func addComma() -> String {
        let comma = ","
        
        var newString = self
        var numCommas = 0
        var stringLength = self.characters.count
        
        func magnitude()  {
            if stringLength >= 9{
                newString = newString.insert(comma, ind: self.characters.count - 3)
                newString = newString.insert(comma, ind: self.characters.count - 6)
                newString = newString.insert(comma, ind: self.characters.count - 9)
            }
            else if stringLength >= 7{
                newString = newString.insert(comma, ind: self.characters.count - 3)
                newString = newString.insert(comma, ind: self.characters.count - 6)
            }
            else if stringLength >= 4 && stringLength < 7 {
                newString = newString.insert(comma, ind: self.characters.count - 3)
            }
            
        }
        magnitude()
        return newString
    }
}