//
//  UIView+Shortcut.h
//  lixiang
//
//  Created by James on 5/20/15.
//  Copyright (c) 2015 lixiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Shortcut)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property CGPoint origin;
@property CGFloat top;
@property CGFloat left;
@property CGFloat bottom;
@property CGFloat right;

- (void)makeCornerRadius:(float)radius borderColor:(UIColor*)bColor borderWidth:(float)bWidth;

@end
