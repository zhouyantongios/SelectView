//
//  SelectView.h
//  SelectorView
//
//  Created by 周彦彤 on 16/3/24.
//  Copyright © 2016年 Developer. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SelectView;

typedef void (^DidChangeSelectViewBlock) (NSInteger index);

@protocol SelectViewDelegate <NSObject>

@optional
- (void)tapSelectViewIndex:(NSInteger)index;

@end

@interface SelectView : UIView

- (instancetype)initWithSelectView:(NSArray *)titles Delegate:(id<SelectViewDelegate>)delegate andFrame:(CGRect)frame;


@property (nonatomic,weak)id<SelectViewDelegate>delegate;

@property (nonatomic,copy)DidChangeSelectViewBlock changeBlock;

@end


@interface CustomerLabel : UILabel

- (instancetype)initWithCustomerLabelWithFrame:(CGRect)frame;

@end
