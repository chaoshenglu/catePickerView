//
//  GoodsCateModel.m
//  lixiang
//
//  Created by lixiang on 2017/6/12.
//  Copyright © 2017年 lixiang. All rights reserved.
//

#import "GoodsCateModel.h"

@implementation GoodsCateModel

+ (NSDictionary *)mj_objectClassInArray {
    return @{
             @"children" : @"GoodsChildCateModel",
             };
}

@end
