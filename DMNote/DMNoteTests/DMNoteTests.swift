//
//  DMNoteTests.swift
//  DMNoteTests
//
//  Created by 杨容清 on 16/3/8.
//  Copyright © 2016年 杨容清. All rights reserved.
//

import XCTest
import RxSwift
import RxCocoa
@testable import DMNote

class DMNoteTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let deferredSequence:Observable<Int> = deferred {
            print("creating")
            return create{ observer in
                print("emmiting")
                observer.on(.Next(0))
                observer.on(.Next(1))
                observer.on(.Next(2))
                observer.on(.Next(3))
                observer.on(.Completed)
                return NopDisposable.instance
            }
        }
        
        
        print("Go")

        deferredSequence.subscribe { (event) -> Void in
            print(event)
        }
        
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
