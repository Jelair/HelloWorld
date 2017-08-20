//
//  ViewController.m
//  HelloWorld
//
//  Created by NowOrNever on 20/08/2017.
//  Copyright © 2017 NowOrNever. All rights reserved.
//

#import "ViewController.h"
#import "EOCAutoDictionary.h"
#import <objc/runtime.h>
#import "NSString+EOCMyAdditions.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /**理解消息转发机制**/
    EOCAutoDictionary *dic = [EOCAutoDictionary new];
    dic.date = [NSDate date];
    NSLog(@"dic.date = %@",dic.date);
    
    /**利用方法调配来调试黑盒**/
    Method originalMethod = class_getInstanceMethod([NSString class], @selector(lowercaseString));
    Method swappedMethod = class_getInstanceMethod([NSString class], @selector(eoc_myLowercaseString));
    method_exchangeImplementations(originalMethod, swappedMethod);
    
    NSString *string = @"This is tHe StRiNg";
    NSString *lowercaseString = [string lowercaseString];
    
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
