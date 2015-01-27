//
//  CalculatorBrainTests.m
//  Calculator
//
//  Created by STUDENT #5 on 1/22/15.
//  Copyright (c) 2015 STUDENT #5. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

//You have to import the class CalculatorBrain
#import "CalculatorBrain.h"

@interface CalculatorBrainTests : XCTestCase

//We create on object of the CelculatorBrain class and call it brain
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

- (void)testSubtraction
{
    [self.brain pushOperand:4];
    [self.brain pushOperand:2];
    double result = [self.brain performOperation:@"-"];
    XCTAssert(result == 2,@"Subraction must properly subtract 2 numbers");
}

- (void)testMultiplication
{
    [self.brain pushOperand:4];
    [self.brain pushOperand:2];
    double result = [self.brain performOperation:@"*"];
    XCTAssert(result == 8,@"Multiplication must properly multiply 2 numbers");
}

-(void)testDivision
{
    [self.brain pushOperand:16];
    [self.brain pushOperand:4];
    double result = [self.brain performOperation:@"/"];
    XCTAssert(result == 4,@"Division must properly divide 2 numbers");
}

@end
