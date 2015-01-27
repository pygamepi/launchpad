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

//This allocates space for the CalculatorBrain class and initializes
//it
- (void)setUp {
    [super setUp]; //This line sets up the test
    self.brain = [[CalculatorBrain alloc] init];
}

//This sets brain to nil so we don't fragment memory
- (void)tearDown {
    [super tearDown]; //This line closes the test
    self.brain = nil;
}

//Here is were we will test our newely created functions
- (void)testAddition
{
    //We push a number "5" to the stack
    [self.brain pushOperand:5];
    
    //Then we push a number "10" to the stack
    [self.brain pushOperand:10];
    
    //Next we use our performOperation function and send a "+"
    //operation
    double result = [self.brain performOperation:@"+"];
    
    //This test what we want to test. So we tell it that the result
    //should equal 15 and add a message of what we are testing should
    //do
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
    //Multiplication test
    [self.brain pushOperand:4];
    [self.brain pushOperand:2];
    double result = [self.brain performOperation:@"*"];
    XCTAssert(result == 8,@"Multiplication must properly multiply 2 numbers");
 
}

-(void)testDivision
{
    //Division test
    [self.brain pushOperand:16];
    [self.brain pushOperand:4];
    double result = [self.brain performOperation:@"/"];
    XCTAssert(result == 4,@"Division must properly divide 2 numbers");
    
}

@end
