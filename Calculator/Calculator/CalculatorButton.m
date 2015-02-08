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
        self.layer.cornerRadius = 25;
        self.layer.borderWidth = 1;
        self.layer.borderColor = [[UIColor clearColor]CGColor];
        [self setBackgroundColor:[UIColor lightGrayColor]];
        
        [self addTarget:self action:@selector(highlightBorder) forControlEvents:UIControlEventTouchDown];
        [self addTarget:self action:@selector(unHighlightBorder) forControlEvents:UIControlEventTouchUpInside];
        [self addTarget:self action:@selector(unHighlightBorder) forControlEvents:UIControlEventTouchUpOutside];
        
        [self setBackgroundImage:[UIImage imageNamed:@"buttonNormal.png"] forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage imageNamed:@"button.Push.png"] forState:UIControlStateHighlighted];
        [self setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    }
    
    return self;
}
         
- (void)highlightBorder
{
    self.layer.borderColor = [[UIColor yellowColor]CGColor];
    
}

- (void)unHighlightBorder
{
    self.layer.borderColor = [[UIColor clearColor]CGColor];
}

@end