//
//  calculatorBrain.h
//  Calculator
//
//  Created by STUDENT #5 on 1/22/15.
//  Copyright (c) 2015 STUDENT #5. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

//Announce that there are to function the app can use
//The pushOperand function
- (void)pushOperand:(double)operand;

//And the performOperation function
- (double)performOperation:(NSString *)operation;



@end
