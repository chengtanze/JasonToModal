//
//  ConvertRootModal.m
//  JasonToModal
//
//  Created by ciwong-huanghg on 15/7/30.
//  Copyright (c) 2015年 Hype. All rights reserved.
//

#import "ConvertRootModal.h"
#import <objc/runtime.h>
#import "TestModal.h"
@implementation ConvertRootModal

-(NSArray *)PropertyKeys{
    
    unsigned int outCount,nIndex;
    objc_property_t *propertys = class_copyPropertyList([self class], &outCount);
    NSMutableArray *keys = [[NSMutableArray alloc] initWithCapacity:0];
    for (nIndex = 0; nIndex < outCount; nIndex++)
    {
        objc_property_t property = propertys[nIndex];
        NSString *propertyName = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        [keys addObject:propertyName];
    }
    
    return keys;
}

-(NSArray *)convertJsonData:(NSArray *)jsonData
{
    if (jsonData == nil || jsonData.count <= 0) {
        return nil;
    }
    
    NSMutableArray * modealArray = [[NSMutableArray alloc]initWithCapacity:10];

    for (id myData in jsonData) {
        @try {
            NSArray *propertyList = [self PropertyKeys];
            for (NSString *key in propertyList)
            {
                [self setValue:[myData objectForKey:key] forKey:key];
            }
        }
        @catch (...) {
            NSLog(@"Modal Type Error!");
        }
        
        [modealArray addObject:self];
    }
    
    return modealArray;
}

@end
