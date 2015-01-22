//
//  Model.h
//  Calculator
//
//  Created by STUDENT #5 on 1/20/15.
//  Copyright (c) 2015 STUDENT #5. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

- (int)add:(int)value1
  toValue2:(int)value2;

- (int)subtract:(int)value1
     fromValue2:(int)value2;

- (int)divide:(int)value1
     byValue2:(int)value2;

- (int)multiply:(int)value1
       byvalue2:(int)value2;

@end
