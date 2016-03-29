//
//  SingleColor.h
//  KVOPrac
//
//  Created by Mac on 16/3/28.
//  Copyright © 2016年 Ada. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SingleColor : NSObject
@property(nonatomic,strong) UIColor *color;
+ (instancetype)sharedSingleColor;
@end
