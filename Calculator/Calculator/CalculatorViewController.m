//
//  ViewController.m
//  Calculator
//
//  Created by STUDENT #5 on 1/20/15.
//  Copyright (c) 2015 STUDENT #5. All rights reserved.
//

#import "CalculatorViewController.h"

@interface CalculatorViewController ()

@property (weak, nonatomic) IBOutlet UILabel *displayLabel;

@property (nonatomic) BOOL isUserInTheMiddleOfEnteringNumber;

@end

@implementation CalculatorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)numberButtonPressed:(UIButton *)sender
{
    NSLog(@"Hey button pressed! %@", [sender currentTitle]);
    
    if (self.isUserInTheMiddleOfEnteringNumber)
    {
        self.displayLabel.text = [self.displayLabel.text stringByAppendingString:sender.currentTitle];
    }
    else
    {
        self.displayLabel.text = sender.currentTitle;
        self.isUserInTheMiddleOfEnteringNumber = YES;
    }
}

- (IBAction)clearButtonPressed:(UIButton *)sender
   {
       self.displayLabel.text = @"0";
       self.isUserInTheMiddleOfEnteringNumber = NO;
   }

@end

