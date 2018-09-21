//
//  RailFenceCipher.swift
//  SpyApp
//
//  Created by Soheil on 9/16/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import Foundation

// Rail Fence Cipher
// Every character is a valid input since the algorithm just change the arrengment of the characters
struct RailFenceCipher :  Cipher {
    func encode(_ plaintext: String, secret: String) -> String? {
        
        guard let rows = Int(secret) else {
            return "Invalid secret. Please privide an number!"
        }
        
        //edge case
        if(rows < 2){
            return plaintext
        }
        
        // make array with Cols:text lenth  Rows: secret
        var matrix = Array(repeating: Array(repeating: "", count: plaintext.count),
                           count: rows)
        
        var dir_down = false
        var row = 0
        
        for i in 0...plaintext.count-1{
            
            if(row == 0 || row == rows - 1){
                dir_down = !dir_down
            }
                        
            matrix[row][i] = String(plaintext.character(at: i)!)
            
            if(dir_down){
                row = row + 1
            }else{
                row = row - 1
            }
        }
        
        var result : String = ""
        
        for i in 0...rows-1{
            for j in 0...plaintext.count-1{
                if(matrix[i][j] != ""){
                    result = result + matrix[i][j]
                }
            }
        }
        return result
    }
    
    func decode(_ encodedText: String, secret: String) -> String? {
        
        
        guard let rows = Int(secret) else {
            return "Invalid secret. Please privide an number!"
        }
        
        if(rows < 2){
            return encodedText
        }
        
        // make array with Cols:text lenth  Rows: secret
        var matrix = Array(repeating: Array(repeating: "", count: encodedText.count),
                           count: rows)
        
        var dir_down = false
        var row = 0
        
        for i in 0...encodedText.count-1{
            
            if(row == 0 || row == rows - 1){
                dir_down = !dir_down
            }
            
            matrix[row][i] = "*"
            
            if(dir_down){
                row = row + 1
            }else{
                row = row - 1
            }
        }
        
        
        // traverse through the matrix and replace * with actual text
        var textIndex: Int = 0
        for i in 0...rows-1{
            for j in 0...encodedText.count-1{
                if(matrix[i][j] == "*"){
                    matrix[i][j] = String(encodedText.character(at: textIndex)!)
                    textIndex = textIndex + 1
                }
            }
        }
        
        // read the matric again and build the text
        dir_down = false
        row = 0
        var result : String = ""
        
        for i in 0...encodedText.count-1{
            
            if(row == 0 || row == rows - 1){
                dir_down = !dir_down
            }
            
            result = result + matrix[row][i]
            
            if(dir_down){
                row = row + 1
            }else{
                row = row - 1
            }
        }
        
        return result
        
    }
}

extension String {
    
    func index(at position: Int, from start: Index? = nil) -> Index? {
        let startingIndex = start ?? startIndex
        return index(startingIndex, offsetBy: position, limitedBy: endIndex)
    }
    
    func character(at position: Int) -> Character? {
        guard position >= 0, let indexPosition = index(at: position) else {
            return nil
        }
        return self[indexPosition]
    }
}
