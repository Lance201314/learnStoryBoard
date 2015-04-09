//
//  UIView+Constraint.m
//  storyboard-01
//
//  Created by lance on 15/4/9.
//  Copyright (c) 2015年 Lance Lan. All rights reserved.
//

#import "UIView+Constraint.h"

@implementation UIView (Constraint)

/**
 *  获取约束
 *
 *  @param firstAttribute
 *  @param firstItem
 *  @param view 约束的view
 *
 *  @return NSLayoutConstraint
 */
- (NSLayoutConstraint *)getContraintWithFirstAttribute:(NSLayoutAttribute)firstAttribute firstItem:(id)firstItem view:(UIView *)view
{
    NSArray *constraints = view.constraints;
    NSLayoutConstraint *searchConstraint = nil;
    
    for (NSLayoutConstraint *constraint in constraints) {
        if (firstItem == constraint.firstItem && firstAttribute == constraint.firstAttribute) {
            searchConstraint = constraint;
            
            break;
        }
    }
    
    return searchConstraint;
}

/**
 *  获取约束
 *
 *  @param secondAttribute
 *  @param firstItem
 *  @param view 约束的view
 *
 *  @return NSLayoutConstraint
 */
- (NSLayoutConstraint *)getContraintWithSecondAttribute:(NSLayoutAttribute)secondAttribute firstItem:(id)firstItem view:(UIView *)view
{
    NSArray *constraints = view.constraints;
    NSLayoutConstraint *searchConstraint = nil;
    
    for (NSLayoutConstraint *constraint in constraints) {
        if (firstItem == constraint.firstItem && secondAttribute == constraint.secondAttribute) {
            searchConstraint = constraint;
            
            break;
        }
    }
    
    return searchConstraint;
}

/**
 *  获取约束
 *
 *  @param firstAttribute
 *  @param secondItem
 *  @param view 约束的view
 *
 *  @return NSLayoutConstraint
 */
- (NSLayoutConstraint *)getContraintWithFirstAttribute:(NSLayoutAttribute)firstAttribute secondItem:(id)secondItem view:(UIView *)view
{
    NSArray *constraints = view.constraints;
    NSLayoutConstraint *searchConstraint = nil;
    
    for (NSLayoutConstraint *constraint in constraints) {
        if (secondItem == constraint.secondItem && firstAttribute == constraint.firstAttribute) {
            searchConstraint = constraint;
            
            break;
        }
        NSLog(@"%@~~~%ld",constraint.firstItem, constraint.firstAttribute);
    }
    
    return searchConstraint;
}

/**
 *  获取约束
 *
 *  @param secondAttribute
 *  @param secondItem
 *  @param view 约束的view
 *
 *  @return NSLayoutConstraint
 */
- (NSLayoutConstraint *)getContraintWithSecondAttribute:(NSLayoutAttribute)secondAttribute secondItem:(id)secondItem view:(UIView *)view
{
    NSArray *constraints = view.constraints;
    NSLayoutConstraint *searchConstraint = nil;
    
    for (NSLayoutConstraint *constraint in constraints) {
        if (secondItem == constraint.secondItem && secondAttribute == constraint.secondAttribute) {
            searchConstraint = constraint;
            
            break;
        }
    }
    
    return searchConstraint;
}

@end
