//
//  SingleColor.m
//  KVOPrac
//
//  Created by Mac on 16/3/28.
//  Copyright © 2016年 Ada. All rights reserved.
//

#import "SingleColor.h"

@implementation SingleColor
+ (instancetype)sharedSingleColor{
    
    static SingleColor *__sharedUser = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __sharedUser = [[self alloc]init];
        
    });
    
    return __sharedUser;
    
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _color = [UIColor redColor];
        
    }
    return self;
}

@end
