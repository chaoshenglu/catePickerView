//
//  GoodsCatePickerView.h
//  lixiang
//
//  Created by lixiang on 2017/6/12.
//  Copyright © 2017年 lixiang. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol GoodsCatePickerViewDelegate <NSObject>


/**
 获取用户选择的商品分类

 @param cateName 一级分类名称
 @param cateId 一级分类ID
 @param childCateName 二级分类名称
 @param childCateId 二级分类ID
 */
- (void)didChooseCate:(NSString *)cateName andCateId:(NSString *)cateId childCateName:(NSString *)childCateName childCateId:(NSString *)childCateId;

@end

@interface GoodsCatePickerView : UIView

- (void)pop;
@property (nonatomic, weak) id<GoodsCatePickerViewDelegate> delegate;

@end


/*
 
 使用示例：
 GoodsCatePickerView *pickerView = [GoodsCatePickerView new];
 pickerView.delegate = self;
 [KeyWindow addSubview:pickerView];
 [pickerView pop];
 
 */
