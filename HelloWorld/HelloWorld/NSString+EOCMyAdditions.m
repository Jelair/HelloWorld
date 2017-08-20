//
//  NSString+EOCMyAdditions.m
//  HelloWorld
//
//  Created by NowOrNever on 20/08/2017.
//  Copyright © 2017 NowOrNever. All rights reserved.
//

#import "NSString+EOCMyAdditions.h"

@implementation NSString (EOCMyAdditions)
- (NSString*)eoc_myLowercaseString{
    NSString *lowercase = [self eoc_myLowercaseString];
    NSLog(@"%@ => %@",self, lowercase);
    return lowercase;
}
@end
