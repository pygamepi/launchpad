//
//  CalculatorBrainTests.m
//  Calculator
//
//  Created by STUDENT #5 on 1/22/15.
//  Copyright (c) 2015 STUDENT #5. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "CalculatorBrain.h"

@interface CalculatorBrainTests : XCTestCase

@property (nonatomic, strong) CalculatorBrain* brain;

@end

@implementation CalculatorBrainTests

- (void)setUp {
    [super setUp];
    self.brain = [[CalculatorBrain alloc] init];
}

- (void)tearDown {
    [super tearDown];
    self.brain = nil;
}

- (void)testAddition
{
    [self.brain pushOperand:5];
    [self.brain pushOperand:10];
    double result = [self.brain performOperation:@"+"];
    XCTAssert(result == 15,@"Addittion must properly add 2 numbers");
    
}

@end
