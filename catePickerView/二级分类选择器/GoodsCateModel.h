//
//  GoodsCateModel.h
//  lixiang
//
//  Created by lixiang on 2017/6/12.
//  Copyright © 2017年 lixiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoodsCateModel : NSObject

@property (nonatomic, strong) NSArray *children;
@property (nonatomic, copy) NSString *id;
@property (nonatomic, assign) int level;
@property (nonatomic, copy) NSString *name;

@end
