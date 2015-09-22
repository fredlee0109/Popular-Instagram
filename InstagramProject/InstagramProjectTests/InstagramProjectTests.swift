//
//  InstagramProjectTests.swift
//  InstagramProjectTests
//
//  Created by FLee on 9/21/15.
//  Copyright © 2015 Fred Lee. All rights reserved.
//

import XCTest
import Alamofire
@testable import InstagramProject

class InstagramProjectTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testHTTPResponse_works() {
        let defaultTimeout: NSTimeInterval = 10
        let expectation = expectationWithDescription("Waiting for response")

        // This piece of code has error, but it's the same as the slide.
        Alamofire.request(.GET, "https://api.instagram.com/v1/media/popular?client_id=c953ffadb974463f9f6813fc4fc91673").responseJSON { _, response, _, error in
                XCTAssertEqual(response!.statusCode, 200)
                XCTAssertNil(error)
            
            expectation.fulfill()
        }
    }
    
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
