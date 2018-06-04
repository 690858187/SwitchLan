//
//  SwitchLan.m
//  SwitchLan
//
//  Created by lyh on 2018/6/4.
//  Copyright © 2018年 lyh. All rights reserved.
//

#import "SwitchLan.h"

#define AppleLanguages @"AppleLanguages"

@interface SwitchLan()

@property (nonatomic, strong) NSArray *languages;

@end

@implementation SwitchLan

static SwitchLan *lan = nil;

+ (instancetype)shareInitialize {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        lan = [[SwitchLan alloc] init];
    });
    return lan;
}

- (NSArray *)allLanguages {
    NSArray *lans = [NSArray arrayWithArray:self.languages];
    return lans;
}

- (NSString *)systemLanguage {
    return [[[SwitchLan shareInitialize] allLanguages] firstObject];
}

- (NSArray *)languages {
    if (!_languages) {
        _languages = [NSArray arrayWithObjects:@"zh-Hans",@"en",@"ja",@"ko",@"ru",@"zh-Hant", nil];
    }
    return _languages;
}

@end
