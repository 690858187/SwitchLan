//
//  NSBundle+SwitchLan.m
//  SwitchLan
//
//  Created by lyh on 2018/6/4.
//  Copyright © 2018年 lyh. All rights reserved.
//

#import "NSBundle+SwitchLan.h"
#import <objc/runtime.h>
#import "SwitchLan.h"

#define LPROj @"lproj"

static const char _bundle=0;

@interface BundleLan : NSBundle
@end

@implementation BundleLan
//NSLocalizedStringFromTableInBundle(key, @"JSQMessages", [NSBundle jsq_messagesAssetBundle], nil)   [bundle localizedStringForKey:(key) value:@"" table:(tbl)
-(NSString*)localizedStringForKey:(NSString *)key value:(NSString *)value table:(NSString *)tableName
{
    NSBundle* bundle=objc_getAssociatedObject(self, &_bundle);
    return bundle ? [bundle localizedStringForKey:key value:value table:tableName] : [super localizedStringForKey:key value:value table:tableName];
}

@end

@implementation NSBundle (SwitchLan)

+ (void)switchLanIndex:(NSInteger)lanIndex {
    NSArray *lans = [NSArray arrayWithArray:[[SwitchLan shareInitialize] allLanguages]];
    if (lans.count<lanIndex) {
        NSString *setLan = [lans objectAtIndex:lanIndex];
        [NSBundle switchLan:setLan];
    }else {
        NSString *error = [NSString stringWithFormat:@"设置语言超过APP所有支持语言%ld",(long)lanIndex];
        NSAssert(NO, error);
    }
}

+ (void)switchLan:(NSString *)lan {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        object_setClass([NSBundle mainBundle],[BundleLan class]);
    });
    
    objc_setAssociatedObject([NSBundle mainBundle], &_bundle, lan ? [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:lan ofType:LPROj]] : nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end

