//
//  CalculatorButton.m
//  Calculator
//
//  Created by STUDENT #5 on 1/28/15.
//  Copyright (c) 2015 STUDENT #5. All rights reserved.
//

#import "CalculatorButton.h"

@implementation CalculatorButton

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (!(self = [super initWithCoder:aDecoder]))
    {
        return nil;
    }
    else
    {
        self.layer.cornerRadius = 10;
        
        [self setBackgroundColor:[UIColor clearColor]];
        [self setBackgroundImage:[UIImage imageNamed:@"button.gif"] forState:UIControlStateNormal];
        
    }
    
    NSLog(@"-[%@ initWithCoder:%@]", self, aDecoder);
    
    return self;
}
         
- (void)highlightBorder
{
    self.layer.borderColor = [[UIColor blueColor]CGColor];
}

@end