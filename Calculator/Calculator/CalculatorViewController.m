//
//  ViewController.m
//  Calculator
//
//  Created by STUDENT #5 on 1/20/15.
//  Copyright (c) 2015 STUDENT #5. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"

@interface CalculatorViewController ()

@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
@property (nonatomic) BOOL isUserInTheMiddleOfEnteringNumber;
@property (weak, nonatomic) NSString *operator;
@property (nonatomic, strong) CalculatorBrain *brain;
@end

@implementation CalculatorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.brain = [[CalculatorBrain alloc] init];
}

- (IBAction)operationButtonPressed:(UIButton *)sender
{
    [self.brain pushOperand:self.displayLabel.text.doubleValue];
    double result = [self.brain performOperation:[sender currentTitle]];
    [self.brain pushOperand:result];
    self.isUserInTheMiddleOfEnteringNumber = NO;
    self.operator = [sender currentTitle];
}

- (IBAction)enterButtonPressed
{
    [self.brain pushOperand:self.displayLabel.text.doubleValue];
    double result = [self.brain performOperation:self.operator];
    self.displayLabel.text = [NSNumber numberWithDouble:result].stringValue;
    self.operator = nil;
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

- (IBAction)clearButtonPressed
{
    self.displayLabel.text = @"0";
    self.isUserInTheMiddleOfEnteringNumber = NO;
    [self.brain clearOperands];
    
}

@end

