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

@end

@implementation CalculatorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

//We added a operationButtonPressed function but
//We haven't implimented it yet
- (IBAction)operationButtonPressed:(id)sender
{
    
}
 //Same with our enterButtonPressed function
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

