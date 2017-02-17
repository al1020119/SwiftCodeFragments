//
//  NSDictionary+CodeFragments.m
//  CodeFragment
//
//  Created by jinyu on 15/2/4.
//  Copyright (c) 2015年 jinyu. All rights reserved.
//

#import "NSDictionary+CodeFragments.h"

@implementation NSDictionary (CodeFragments)

- (NSString *)jsonstring {
    NSError *error = nil;
    id result = [NSJSONSerialization dataWithJSONObject:self options:kNilOptions error:&error];
    
    if (error) {
        NSLog(@"字典转JSON发生错误！");
        return @"";
    }
    
    return [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];
}

@end
