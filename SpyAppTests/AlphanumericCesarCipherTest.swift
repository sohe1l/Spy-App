//
//  AlphanumericCesarCipherTest.swift
//  SpyAppTests
//
//  Created by Soheil on 9/20/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import XCTest
@testable import SpyApp


class AlphanumericCesarCipherTest: XCTestCase {
    
    var cipher: Cipher!
    
    override func setUp() {
        super.setUp()
        cipher = AlphanumericCesarCipher()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    
    func test_PositiveCyclicTest() {
        let plaintext = "Z9Z9Z9"
        
        let result = cipher.encode(plaintext, secret: "1")
        
        XCTAssertEqual("0A0A0A", result)
    }
    
    
    func test_NegitiveCyclicTest() {
        let plaintext = "A0A0A0"
        
        let result = cipher.encode(plaintext, secret: "-1")
        
        XCTAssertEqual("9Z9Z9Z", result)
    }

    
    func test_StringDecodesBackToOriginalString() {
        
        let plaintext = "randomtestcyclicA09Z"
        
        let encoded = cipher.encode(plaintext, secret: "10")!
        
        let decoded = cipher.decode(encoded, secret: "10")!
        
        
        XCTAssertEqual(plaintext.uppercased() , decoded)
    }
    
    
}
