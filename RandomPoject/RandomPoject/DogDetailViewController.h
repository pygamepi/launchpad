//
//  DogDetailViewController.h
//  RandomPoject
//
//  Created by STUDENT #5 on 1/29/15.
//  Copyright (c) 2015 STUDENT #5. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DogDetailViewController;

@protocol DogEditedDelegate <NSObject>

- (void)dogDetailViewController:(DogDetailViewController *)vc didUpdateDowWithBreed:(NSString *)breed;

@end

@interface DogDetailViewController : UIViewController

@property (nonatomic, strong) NSString *breed;
@property (nonatomic, assign) id<DogEditedDelegate> delegate;

@end
