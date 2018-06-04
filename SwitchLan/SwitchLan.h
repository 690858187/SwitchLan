//
//  SwitchLan.h
//  SwitchLan
//
//  Created by lyh on 2018/6/4.
//  Copyright © 2018年 lyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SwitchLan : NSObject

+ (instancetype)shareInitialize;

/** 获取APP支持的所有语言*/
- (NSArray *)allLanguages;

/** 获取APP的系统语言*/
- (NSString *)systemLanguage;

@end
