//
//  SelectView.m
//  SelectorView
//
//  Created by 周彦彤 on 16/3/24.
//  Copyright © 2016年 Developer. All rights reserved.
//

#import "SelectView.h"

@class CustomerLabel;

@interface SelectView (){
    CGRect _rectFrame;
    UIView *_lineView;
}

@end

@implementation SelectView

- (instancetype)initWithSelectView:(NSArray *)titles Delegate:(id<SelectViewDelegate>)delegate andFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.delegate = delegate;
        _rectFrame = frame;
        [self initUIWithTitles:titles];
    }
    return self;
}

- (void)initUIWithTitles:(NSArray *)titles {
    NSInteger count = titles.count;
    CGFloat width = _rectFrame.size.width / count;
    CGFloat height = _rectFrame.size.height - 1;
    for (NSInteger i = 0; i < titles.count; i++) {
        CustomerLabel *customerLabel = [[CustomerLabel alloc]initWithCustomerLabelWithFrame:CGRectMake(i * width, 0, width, height)];
        customerLabel.text = [titles objectAtIndex:i];
        customerLabel.textAlignment = NSTextAlignmentCenter;
        customerLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        customerLabel.tag = 100+i;
        customerLabel.userInteractionEnabled = YES;
//        customerLabel.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
        [self addSubview:customerLabel];
        
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(selectView:)];
        [customerLabel addGestureRecognizer:tapGes];
    }
    _lineView = [[UIView alloc]initWithFrame:CGRectMake(0, height, width, 1)];
    _lineView.backgroundColor = [UIColor redColor];
    [self addSubview:_lineView];
}

- (void)selectView:(UITapGestureRecognizer *)tapGes {
    UIView *customerLabel = tapGes.view;
    CGFloat x = customerLabel.frame.origin.x;
//    CGFloat y = customerLabel.frame.origin.y;
    CGFloat width = customerLabel.frame.size.width;
    CGFloat height = customerLabel.frame.size.height;
    [UIView animateWithDuration:0.5 animations:^{
        _lineView.frame = CGRectMake(x, height, width, 1);
    }];
    if (self.delegate && [self.delegate respondsToSelector:@selector(tapSelectViewIndex:)]) {
        if (customerLabel.tag) {
            [self.delegate tapSelectViewIndex:customerLabel.tag - 100];
        }
    }
    //block回调
    if (self.changeBlock) {
        self.changeBlock(customerLabel.tag - 100);
    }
}

@end

#pragma mark ------------------------------------------------------------------

@implementation CustomerLabel

- (instancetype)initWithCustomerLabelWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView {
    
}

@end
