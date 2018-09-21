//
//  VigenereCipher.swift
//  SpyApp
//
//  Created by Soheil on 9/16/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import Foundation

// Vingenere Cipher
// Valid inputs defined in CharList
// The algorithm allows to simply add new character to CharList to support for encoding
// https://www.geeksforgeeks.org/vigenere-cipher/

struct VigenereCipher: Cipher {
    let CharList = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789 _-"
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
        if(secret.count < 1 ){
            return "Enter an alphabetic secret"
        }
        let key: String = getKey(secret: secret, len: plaintext.count)
        var encoded: String = ""
        
        for i in 0...plaintext.count-1{
            let indexString = getCharacterPos(plaintext.character(at: i)!)
            
            if(indexString == -1){
                return "Invalid input."
            }
            
            let indexSecret = getCharacterPos(key.character(at: i)!)
            let shifted = (CharList.count + indexString + indexSecret) % CharList.count
            encoded = encoded + String(CharList.character(at: shifted)!)
        }
        return encoded
    }
    
    func decode(_ encodedText: String, secret: String) -> String? {
        if(secret.count < 1 ){
            return "Enter an alphabetic secret"
        }
        
        let key: String = getKey(secret: secret, len: encodedText.count)
        var decoded: String = ""
        
        for i in 0...encodedText.count-1{
            let indexString = getCharacterPos(encodedText.character(at: i)!)
            
            if(indexString == -1){
                return "Invalid input."
            }
            
            let indexSecret = getCharacterPos(key.character(at: i)!)
            let shifted = (CharList.count + indexString - indexSecret) % CharList.count
            decoded = decoded + String(CharList.character(at: shifted)!)
        }
        return decoded
    }
    
    
    func getKey(secret: String, len: Int) -> String {
        var key = secret
        while(true){
            if(key.count >= len){
                return key
            }
            key = key + secret
        }
    }
}
