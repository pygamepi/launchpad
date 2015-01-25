//
//  calculatorBrain.m
//  Calculator
//
//  Created by STUDENT #5 on 1/22/15.
//  Copyright (c) 2015 STUDENT #5. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain ()

//This is a array whcih we are using similiar to a
//stack. It will be holding the numbers the user
//enters. We will pop off numbers or pop on numbers
//When the user presses buttons
@property (nonatomic, strong) NSMutableArray *operandsStack;

@end

@implementation CalculatorBrain

//We use synthesize, because of a bug. We created
//operandsStack using @property and then below tried
//to override the set and call functions making it
//so we couldn't call the variable dirrectly using
//"_operandsStack
@synthesize operandsStack = _operandsStack;

//This is the set function
- (NSMutableArray *)operandsStack
{
    //We check to see if operandsStack has been
    //initialized. The "!" = not so
    //!_operandsStack = not_operandsStack
    if (!_operandsStack)
    {
        //So if not _operandsStack then we allocate
        //space for the variable and initialize it
        _operandsStack = [[NSMutableArray alloc] init];
    }
    //Then we return it
    return _operandsStack;
}

//This function "Pops on" a number the user entered
//onto our operandsStack. Operand is the paramater of
//the function where we pass the number to
- (void)pushOperand:(double)operand
{
    //Adds operand to the top of the stack
    [self.operandsStack addObject:@(operand)];
}

//This function "Pops off" the top number (The last
//number the user untered)
- (double)popOperand
{
    //We get the value of the top number using
    //lastobject and convert it to a value of double
    //which operand gets set to
    double operand = [[self.operandsStack lastObject] doubleValue];
    
    //Here we check if there really is an object on
    //the stack
    if ([self.operandsStack lastObject])
    {
        //Then we remove it if it does exit. We don't
        //Want to have it on the stack since we will
        //only use it for a calculation once
        [self.operandsStack removeLastObject];
    }
    
    //Then we return operand
    return operand;
}

//This function gets passed an opperation string
//and evaluates data on the stack according to
//what was sent. "+" for addition "-" for subtraction
//etc
- (double)performOperation:(NSString *)operation
{
    //We create a result variable and set it = to 0
    double result = 0;
    
    //We check what operation was passed. Here it is
    //a "+" for addition
    if ([operation isEqualToString:@"+"])
    {
        //Here we pop and number off and add it to
        //another number we pop off and set the result
        // = to the result
        result = [self popOperand] + [self popOperand];
    }
    
    //Then we return the result
    return result;
}

@end
