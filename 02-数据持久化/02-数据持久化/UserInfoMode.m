//
//  UserInfoMode.m
//  02-数据持久化
//
//  Created by qingyun on 15/11/23.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "UserInfoMode.h"

@implementation UserInfoMode


/*
 *编码器
 *对象序列化
 *对象===>NSData
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_username forKey:@"username"];
    [aCoder encodeObject:_pwd forKey:@"pwd"];
    [aCoder encodeInteger:_uid forKey:@"uid"];
    [aCoder encodeBool:_sex forKey:@"sex"];
    
}

/*
 *解码器
 *对象反序列化
 *NSData====>对象
 */
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        
        //解码操作
        //存什么取什么，key保持一致
        _username = [aDecoder decodeObjectForKey:@"username"];
        _pwd = [aDecoder decodeObjectForKey:@"pwd"];
        _uid = [aDecoder decodeIntegerForKey:@"uid"];
        _sex = [aDecoder decodeBoolForKey:@"sex"];
    }
    return self;
}


@end
