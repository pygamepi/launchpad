//
//  Model.m
//  Calculator
//
//  Created by STUDENT #5 on 1/20/15.
//  Copyright (c) 2015 STUDENT #5. All rights reserved.
//

#import "Model.h"

@implementation Model

- (int)add:(int)value1
  toValue2:(int)value2
{
    int answer;
 
    answer = (value1 + value2);
    
    return answer;
}

- (int)subtract:(int)value1
     fromValue2:(int)value2
{
    int answer;
    
    answer = (value1 - value2);
    
    return answer;
}

- (int)divide:(int)value1
     byValue2:(int)value2
{
    int answer;
    
    answer = (value1 / value2);
    
    return answer;
}

- (int)multiply:(int)value1
       byvalue2:(int)value2
{
    int answer;
    
    answer = (value1 * value2);
    
    return answer;
}

@end
