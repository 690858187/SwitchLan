//
//  NSBundle+SwitchLan.h
//  SwitchLan
//
//  Created by lyh on 2018/6/4.
//  Copyright © 2018年 lyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSBundle (SwitchLan)
/** 设置程序的语言*/
+ (void)switchLanIndex:(NSInteger)lanIndex;

/** 设置程序的语言*/
+ (void)switchLan:(NSString *)lan;

@end
