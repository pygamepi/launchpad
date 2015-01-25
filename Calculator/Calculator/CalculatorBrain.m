//
//  calculatorBrain.m
//  Calculator
//
//  Created by STUDENT #5 on 1/22/15.
//  Copyright (c) 2015 STUDENT #5. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain ()

@property (nonatomic, strong) NSMutableArray *operandsStack;

@end

@implementation CalculatorBrain

@synthesize operandsStack = _operandsStack;

- (NSMutableArray *)operandsStack
{
    if (!_operandsStack)
    {
        _operandsStack = [[NSMutableArray alloc] init];
    }
    
    return _operandsStack;
}

- (void)pushOperand:(double)operand
{
    [self.operandsStack addObject:@(operand)];
}

- (double)popOperand
{
    double operand = [[self.operandsStack lastObject] doubleValue];
    
    if ([self.operandsStack lastObject])
    {
        [self.operandsStack removeLastObject];
    }
    
    return operand;
}

- (double)performOperation:(NSString *)operation
{
    double result = 0;
    
    if ([operation isEqualToString:@"+"])
    {
        result = [self popOperand] + [self popOperand];
    }
    
    return result;
}

@end
