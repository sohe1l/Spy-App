//
//  AlphanumericCesarCipher.swift
//  SpyApp
//
//  Created by Soheil on 9/20/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import Foundation

// Acceps the character in char list...
// spaces or special characters are not allowed
// the string will be uppercased as per as the homework sheet

struct AlphanumericCesarCipher: Cipher {
    
    let CharList = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    
    
    func getCharacterPos(_ char: Character) -> Int {
        var counter = 0
        for c in CharList{
            if(c == char){
                return counter
            }
            counter = counter + 1
        }
        return -1
    }
    
    func encode(_ plaintext: String, secret: String) -> String? {
        
        guard let shift = Int(secret) else {
            return "Invalid secret. Please privide an number!"
        }
        
        var encoded: String = ""
        
        for character in plaintext.uppercased() {
            let indexString = getCharacterPos(character)
            if(indexString == -1){
                return "Invalid input."
            }
            let shifted = (CharList.count + indexString + shift) % CharList.count
            encoded = encoded + String(CharList.character(at: shifted)!)
        }
        
        print(encoded)
        return encoded
        
        
    }
    
    func decode(_ encodedText: String, secret: String) -> String? {
        
        guard let shift = Int(secret) else {
            return "Invalid secret. Please privide an number!"
        }
        
        var decoded = ""
        
        for character in encodedText.uppercased() {
            let indexString = getCharacterPos(character)
            if(indexString == -1){
                return "Invalid input."
            }
            let shifted = (CharList.count + indexString - shift) % CharList.count
            decoded = decoded + String(CharList.character(at: shifted)!)
        }
        return decoded
    }
    
}
