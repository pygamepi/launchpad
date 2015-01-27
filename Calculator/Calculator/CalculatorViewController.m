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

//We added a boolean variable to keep track of what the user is doing
//Side not a boolean is a variable that is only set to true or false
//In Objective C true and false is YES and NO
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
        //If they are we append the current title of the button that
        //was pressed onto the label so it doesn't overide what was
        //on the label
        self.displayLabel.text = [self.displayLabel.text stringByAppendingString:sender.currentTitle];
    }
    else
    {
        //If the user is not in the middle of entering a number we
        //set the label to the title of the button that was pressed
        //so we don't have to worry about the zero that the label
        //stats with when it is first drawn to the screen or after
        //the user hits clear or enter
        self.displayLabel.text = sender.currentTitle;
        
        //Then we tell the app the user is not in the middle of
        //entering a number
        self.isUserInTheMiddleOfEnteringNumber = YES;
    }
}

//We changed the clearButtonPressed a little bit
- (IBAction)clearButtonPressed:(UIButton *)sender
   {
       //We set the label to "0"
       self.displayLabel.text = @"0";
       
       //Then we our boolean to NO verifying the user is now not
       //in the middle of entering a number
       self.isUserInTheMiddleOfEnteringNumber = NO;
   }

@end

