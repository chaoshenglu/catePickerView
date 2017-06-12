//
//  ViewController.m
//  catePickerView
//
//  Created by lixiang on 2017/6/12.
//  Copyright © 2017年 lixiang. All rights reserved.
//

#import "ViewController.h"
#import "GoodsCatePickerView.h"

#define WidthOfScreen       [UIScreen mainScreen].bounds.size.width
#define HeightOfScreen      [UIScreen mainScreen].bounds.size.height
#define KeyWindow           [UIApplication sharedApplication].keyWindow

@interface ViewController ()<GoodsCatePickerViewDelegate>

@property (nonatomic, strong) UILabel *textLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 20, 70, 44)];
    [btn setTitleColor:[UIColor blueColor] forState:0];
    [btn addTarget:self action:@selector(click2choose) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"选择" forState:0];
    [self.view addSubview:btn];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 60, 300, 20)];
    label.font = [UIFont systemFontOfSize:17];
    label.textColor = [UIColor blackColor];
    [self.view addSubview:label];
    self.textLabel = label;
}

- (void)click2choose {
    GoodsCatePickerView *pickerView = [GoodsCatePickerView new];
    pickerView.delegate = self;
    [KeyWindow addSubview:pickerView];
    [pickerView pop];
}

- (void)didChooseCate:(NSString *)cateName andCateId:(NSString *)cateId childCateName:(NSString *)childCateName childCateId:(NSString *)childCateId {
    self.textLabel.text = [NSString stringWithFormat:@"%@-%@",cateName,childCateName];
}

@end
