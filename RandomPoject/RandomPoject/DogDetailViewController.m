//
//  DogDetailViewController.m
//  RandomPoject
//
//  Created by STUDENT #5 on 1/29/15.
//  Copyright (c) 2015 STUDENT #5. All rights reserved.
//

#import "DogDetailViewController.h"

@interface DogDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *dogBreadLabel;

@end

@implementation DogDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dogBreadLabel.text = self.breed;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doneEditingPressed:(id)sender
{
    [self.delegate dogDetailViewController:self didUpdateDowWithBreed:self.breed];
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
