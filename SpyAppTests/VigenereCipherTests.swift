//
//  VigenereCipherTests.swift
//  SpyAppTests
//
//  Created by Soheil on 9/20/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import XCTest
@testable import SpyApp

class VigenereCipherTests: XCTestCase {
    
    
    var cipher: Cipher!
    
    override func setUp() {
        super.setUp()
         cipher = VigenereCipher()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func test_StringDecodesBackToOriginalString() {
        let plaintext = "random test string"
        
        let encoded = cipher.encode(plaintext, secret: "3")!
        
        let decoded = cipher.decode(encoded, secret: "3")!

        
        XCTAssertEqual(plaintext, decoded)
    }
    
}








