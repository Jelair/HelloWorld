//
//  ViewController.m
//  HelloWorld
//
//  Created by NowOrNever on 20/08/2017.
//  Copyright © 2017 NowOrNever. All rights reserved.
//

#import "ViewController.h"
#import "EOCAutoDictionary.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    EOCAutoDictionary *dic = [EOCAutoDictionary new];
    dic.date = [NSDate date];
    NSLog(@"dic.date = %@",dic.date);
}

- (void)askUserAQuestion{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Question" message:@"What do you want to do?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Continue", nil];
    [alert show];
}

//UIAlertViewDelegate protocol method
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        //do Cancel
    } else{
        //do Continue
    }
}




@end
