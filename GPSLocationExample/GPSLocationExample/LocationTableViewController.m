//
//  LocationTableViewController.m
//  LocationGPSExample
//
//  Created by STUDENT #5 on 2/3/15.
//  Copyright (c) 2015 STUDENT #5. All rights reserved.
//

#import "LocationTableViewController.h"
#import <MapKit/MapKit.h>

@interface LocationTableViewController () <CLLocationManagerDelegate> //Have to add the protocal for CLLocationManagerDelegate or the delegate wouldn't work it isn't there by default

@property (nonatomic, strong) CLLocationManager *locationManager;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (nonatomic, strong) NSDictionary *infoDictionary;

@property (nonatomic, strong) CLLocation *currentLocation;

@end

@implementation LocationTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Once view loads call our setup method
    [self setupLocationManager];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return self.infoDictionary.allKeys.count;
}

 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Info cell" forIndexPath:indexPath];
    
    //Set our cell text and detail text to info from our dictionary
    cell.textLabel.text = self.infoDictionary.allKeys[indexPath.row];
    cell.detailTextLabel.text = [self.infoDictionary objectForKey:self.infoDictionary.allKeys[indexPath.row]];
 
 return cell;
 }

#pragma mark - Location Manager

- (void)setupLocationManager
{
    //Setup locationManager
    self.locationManager = [[CLLocationManager alloc] init];
    
    //Set the LocationTableViewController as the delegate for CLLocationManager
    self.locationManager.delegate = self;
    
    //Set the resquestAlwaysAuthorization so user can request a GPS coordinate
    [self.locationManager requestAlwaysAuthorization];
    
    //Set the TrackingMode to follow the user to show their location
    [self.mapView setUserTrackingMode:MKUserTrackingModeFollow animated:YES];
    [self.locationManager startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    //Output locaiton info to our log
    NSLog(@"Location = %@", locations);
    
    //Get the last loction in locationManager
    self.currentLocation = [locations lastObject];
    
    //Call our method to pull data from the server for current location
    [self pullDataFromServer];
}

#pragma mark - Server code

- (void)pullDataFromServer
{
    [self.locationManager setDistanceFilter:1000];
    
    //create and format the url to request information about our current location from the api
    NSString *urlString = [NSString stringWithFormat:@"http://api.sunrise-sunset.org/json?lat=%f&lng=%f", self.currentLocation.coordinate.latitude, self.currentLocation.coordinate.longitude];
    
    //Create a request with an NSURL convienience method to alloc and init the variable and set the properties
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    //Create response variable to hold response info
    //NSURLResponse *response;
    
    //Create error variable to catch any error info
    //NSError *error;
    
    //get data from a request on the url
    //NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    NSOperationQueue *qeue = [[NSOperationQueue alloc] init];
    
    [NSURLConnection sendAsynchronousRequest:request queue:qeue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
    {
        if ([data length] >0 && error == nil)
        {
            NSLog(@"Request was succesful");
            
            //add data to our dictionary with a reference key
            self.infoDictionary = [[NSJSONSerialization JSONObjectWithData:data options:0 error:nil] objectForKey:@"results"];
            
            //reload the table view so we can do stuff
            [self.tableView reloadData];
        }
        else if ([data length] == 0 && error == nil)
        {
            NSLog(@"Nothing was downloaded.");
        }
        else if (error != nil){
            NSLog(@"Error = %@", error);
        }
    }];
}

@end
