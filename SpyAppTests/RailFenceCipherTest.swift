//
//  RailFenceCipherTest.swift
//  SpyAppTests
//
//  Created by Soheil on 9/20/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import XCTest
@testable import SpyApp

class RailFenceCipherTest: XCTestCase {
    
    var cipher: Cipher!
    
    override func setUp() {
        super.setUp()
        cipher = RailFenceCipher()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func test_StringDecodesBackToOriginalString() {
        
        let plaintext = "random test string random test string 123"
        
        let encoded = cipher.encode(plaintext, secret: "3")!
        
        let decoded = cipher.decode(encoded, secret: "3")!
        
        
        XCTAssertEqual(plaintext, decoded)
    }
    
    
    func test_StringAbCdWithSecret2GetsACbd() {
        let plaintext = "AbCd"
        
        let result = cipher.encode(plaintext, secret: "2")
        
        XCTAssertEqual("ACbd", result)
    }
    
}
