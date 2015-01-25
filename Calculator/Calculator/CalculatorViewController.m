//
//  ViewController.m
//  Calculator
//
//  Created by STUDENT #5 on 1/20/15.
//  Copyright (c) 2015 STUDENT #5. All rights reserved.
//

#import "CalculatorViewController.h"
#import "Model.h"

@interface CalculatorViewController ()

@property (weak, nonatomic) IBOutlet UILabel *displayLabel;

@property (nonatomic) int answer;
@property (nonatomic) int value;

@end

@implementation CalculatorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)operationButtonPressed:(id)sender
{
    
}

- (IBAction)enterButtonPressed
{
    
}

- (IBAction)numberButtonPressed:(UIButton *)sender
{
    NSLog(@"Hey button pressed! %@", [sender currentTitle]);
    
    if ([self.displayLabel.text isEqualToString:@"0"])
    {
        self.displayLabel.text = sender.currentTitle;
    }
    else
    {
        self.displayLabel.text = [self.displayLabel.text stringByAppendingString:sender.currentTitle];
    }
}

@end

