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
     
     - returns: The source string replaced with the replacement
     */
    private func replace(string: String, replacement: String) -> String {
        return self.stringByReplacingOccurrencesOfString(string, withString: replacement, options: NSStringCompareOptions.LiteralSearch, range: nil)
    }

    /**
     All purpose string replacement

     - parameter value: replace value
     - parameter with:  with this value

     - returns: The string with instances of value replaced with "with"
     */
    func replace(value: String, with: String = "") -> String {
        return self.replace(value, replacement: with)
    }

    /**
     Inserts a string into an already established string

     - parameter string: string to insert
     - parameter ind:    index to insert the string at

     - returns: The string with the input string added at the index
     */
    private func insert(string: String, ind: Int) -> String {
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
        
        func magnitude() {
            if stringLength >= 9{
                newString = newString.insert(comma, ind: self.characters.count - 3)
                newString = newString.insert(comma, ind: self.characters.count - 6)
                newString = newString.insert(comma, ind: self.characters.count - 9)
            }
            else if stringLength >= 7 {
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
