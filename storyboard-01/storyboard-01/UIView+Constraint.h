//
//  UIView+Constraint.h
//  storyboard-01
//
//  Created by lance on 15/4/9.
//  Copyright (c) 2015年 Lance Lan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Constraint)

/**
 *  获取约束
 *
 *  @param firstAttribute
 *  @param firstItem
 *  @param view 约束的view
 *
 *  @return NSLayoutConstraint
 */
- (NSLayoutConstraint *)getContraintWithFirstAttribute:(NSLayoutAttribute)firstAttribute firstItem:(id)firstItem view:(UIView *)view;
/**
 *  获取约束
 *
 *  @param secondAttribute
 *  @param firstItem
 *  @param view 约束的view
 *
 *  @return NSLayoutConstraint
 */
- (NSLayoutConstraint *)getContraintWithSecondAttribute:(NSLayoutAttribute)secondAttribute firstItem:(id)firstItem view:(UIView *)view;
/**
 *  获取约束
 *
 *  @param firstAttribute
 *  @param secondItem
 *  @param view 约束的view
 *
 *  @return NSLayoutConstraint
 */
- (NSLayoutConstraint *)getContraintWithFirstAttribute:(NSLayoutAttribute)firstAttribute secondItem:(id)secondItem view:(UIView *)view;
/**
 *  获取约束
 *
 *  @param secondAttribute
 *  @param secondItem
 *  @param view 约束的view
 *
 *  @return NSLayoutConstraint
 */
- (NSLayoutConstraint *)getContraintWithSecondAttribute:(NSLayoutAttribute)secondAttribute secondItem:(id)secondItem view:(UIView *)view;

@end
