//
//  AssociatedObjectViewController.m
//  HelloWorld
//
//  Created by NowOrNever on 20/08/2017.
//  Copyright © 2017 NowOrNever. All rights reserved.
//

#import "AssociatedObjectViewController.h"
#import <objc/runtime.h>

@interface AssociatedObjectViewController ()

@end

@implementation AssociatedObjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

static void *EOCMyAlertViewKey = @"ECOMyAlertViewKey";

- (void)askUserAQuestion{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Question" message:@"What do you want to do?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Continue", nil];
    
    void (^block)(NSInteger) = ^(NSInteger buttonIndex){
        if (buttonIndex == 0) {
            //do Cancel
        }else{
            //do Continue
        }
    };
    
    objc_setAssociatedObject(alert,
                             EOCMyAlertViewKey,
                             block,
                             OBJC_ASSOCIATION_COPY);
    
    [alert show];
}

//UIAlertViewDelegate protocol method
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    void (^block)(NSInteger) = objc_getAssociatedObject(alertView, EOCMyAlertViewKey);
    block(buttonIndex);
}

@end
