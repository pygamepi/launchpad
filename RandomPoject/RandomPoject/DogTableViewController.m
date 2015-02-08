//
//  DogTableViewController.m
//  RandomPoject
//
//  Created by STUDENT #5 on 1/29/15.
//  Copyright (c) 2015 STUDENT #5. All rights reserved.
//

#import "DogTableViewController.h"

@interface DogTableViewController ()

@property (nonatomic, strong) NSArray *model;

@end

@implementation DogTableViewController

#pragma mark - View Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self myOwnMethod];
    
    NSLog(@"tableview delagate %@", self.tableView.delegate);
    NSLog(@"tableview datasource %@", self.tableView.dataSource);
    
    self.model = @[@"Golden Doodle", @"Bulldog", @"Mutt", @"Beagel", @"Shnauzer"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.model.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"dog cell" forIndexPath:indexPath];
    cell.textLabel.text = [self.model objectAtIndex:indexPath.row];
    
    return cell;
}


#pragma mark - DogEditedDelegate

- (void)dogDetailViewController:(DogTableViewController *)vc didUpdateDowWithBreed:(NSString *)breed
{
    NSLog(@"Edited %@", breed);
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"open dog detail view controller"])
    {
        DogDetailViewController *vc = [segue destinationViewController];
        vc.breed = self.model[self.tableView.indexPathForSelectedRow.row];
        vc.delegate = self;
    }
}

#pragma mark - AlertView Delegate Methods

- (void)myOwnMethod
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Test" message:@"Hi Derek" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"AlertView clicked button");
}

@end
