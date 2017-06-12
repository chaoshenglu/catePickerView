//
//  GoodsCatePickerView.m
//  lixiang
//
//  Created by lixiang on 2017/6/12.
//  Copyright © 2017年 lixiang. All rights reserved.
//

#import "GoodsCatePickerView.h"
#import "GoodsCateModel.h"
#import "GoodsChildCateModel.h"
#import "UIView+Shortcut.h"
#import "MJExtension.h"

#define WidthOfScreen       [UIScreen mainScreen].bounds.size.width
#define HeightOfScreen      [UIScreen mainScreen].bounds.size.height
#define KeyWindow           [UIApplication sharedApplication].keyWindow


@interface GoodsCatePickerView ()<UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic, strong) NSMutableArray *modelArr;
@property (nonatomic, strong) NSArray *childModelArr;
@property (nonatomic, strong) UIPickerView *pickerView;
@property (nonatomic, copy) NSString *goodsCate;
@property (nonatomic, copy) NSString *goodsChildCate;
@property (nonatomic, copy) NSString *goodsCateId;
@property (nonatomic, copy) NSString *goodsChildCateId;
@property (nonatomic, strong) UIView *box;

@end

@implementation GoodsCatePickerView

- (void)pop {
    self.frame = CGRectMake(0, 0, WidthOfScreen, HeightOfScreen);
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
    
    self.box =[[UIView alloc]initWithFrame:CGRectMake(0, HeightOfScreen, WidthOfScreen, 250)];
    self.box.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.box];
    
    UIButton *finishBtn = [[UIButton alloc]initWithFrame:CGRectMake(WidthOfScreen-100, 0, 100, 50)];
    [finishBtn addTarget:self action:@selector(click2finish) forControlEvents:UIControlEventTouchUpInside];
    [finishBtn setTitle:@"完成" forState:0];
    [finishBtn setTitleColor:[UIColor blueColor] forState:0];
    [self.box addSubview:finishBtn];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 49, WidthOfScreen, 1)];
    line.backgroundColor = [UIColor lightGrayColor];
    [self.box addSubview:line];
    
    self.pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 50, WidthOfScreen, 200)];
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    [self.box addSubview:self.pickerView];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"goodsCatePick.json" ofType:nil];
    NSData *jdata = [[NSData alloc]initWithContentsOfFile:path];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jdata options:kNilOptions error:nil];
    NSArray *data = [dic objectForKey:@"data"];
    [self.modelArr addObjectsFromArray:[GoodsCateModel mj_objectArrayWithKeyValuesArray:data]];
    GoodsCateModel *model = self.modelArr[0];
    self.childModelArr = model.children;
    self.goodsCate = model.name;
    self.goodsCateId = model.id;
    GoodsChildCateModel *childModel = model.children[0];
    self.goodsChildCate = childModel.name;
    self.goodsChildCateId = childModel.id;
    
    [self.pickerView reloadAllComponents];
    
    [UIView animateWithDuration:0.3 animations:^{
        self.box.y = HeightOfScreen-250;
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self close];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return self.modelArr.count;
    }else{
        return self.childModelArr.count;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == 0) {
        GoodsCateModel *model = self.modelArr[row];
        return model.name;
    }else {
        GoodsChildCateModel *childModel = self.childModelArr[row];
        return childModel.name;
    }
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 40;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component == 0) {
        GoodsCateModel *model = self.modelArr[row];
        self.childModelArr = model.children;
        self.goodsCateId = model.id;
        self.goodsCate = model.name;
        if (model.children.count > 0) {
            GoodsChildCateModel *childModel = model.children[0];
            self.goodsChildCateId = childModel.id;
            self.goodsChildCate = childModel.name;
        }else{
            self.goodsChildCateId = nil;
            self.goodsChildCate = nil;
        }
        [self.pickerView reloadComponent:1];
    }else{
        GoodsChildCateModel *childModel = self.childModelArr[row];
        self.goodsChildCateId = childModel.id;
        self.goodsChildCate = childModel.name;
    }
}

- (void)click2finish {
    [self close];
    [self.delegate didChooseCate:self.goodsCate andCateId:self.goodsCateId childCateName:self.goodsChildCate childCateId:self.goodsChildCateId];
}

- (void)close {
    [UIView animateWithDuration:0.3 animations:^{
        self.box.y = HeightOfScreen;
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
    }completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (NSMutableArray *)modelArr {
    if (_modelArr == nil) {
        _modelArr = [NSMutableArray array];
    }
    return _modelArr;
}

@end



