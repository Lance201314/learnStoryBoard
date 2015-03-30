//
//  CustomCell.m
//  storyboard-01
//
//  Created by lance on 15/3/30.
//  Copyright (c) 2015年 Lance Lan. All rights reserved.
//

#import "CustomCell.h"

@interface CustomCell ()
{
    UIView *_snapView;
}

@end

@implementation CustomCell

- (void)awakeFromNib {
    // Initialization code
    
    _shadowView.layer.shadowColor = [UIColor blackColor].CGColor;
    _shadowView.layer.shadowOffset = CGSizeMake(2, 2);
    _shadowView.layer.shadowOpacity = 0.5;
    _shadowView.layer.shadowRadius = 5;
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPresGesture:)];
    [self.contentView addGestureRecognizer:longPress];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)handleLongPresGesture:(UILongPressGestureRecognizer *)gesture
{
    CGPoint startPoint = CGPointZero;
    
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
        {
            _snapView = [_containerView snapshotViewAfterScreenUpdates:NO];
            startPoint = [gesture locationInView:self.contentView];
            
            _snapView.frame = _containerView.frame;
            _snapView.transform = CGAffineTransformMakeRotation(M_PI / 30.0);
            [self.contentView addSubview:_snapView];
            
            _containerView.hidden = YES;
            _shadowView.hidden = YES;
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            CGPoint changePoint = [gesture locationInView:self.contentView];
            _snapView.center = changePoint;
        }
            break;
        case UIGestureRecognizerStateEnded:
        {
            CGPoint endPoint = [gesture locationInView:self.contentView];
            if (endPoint.x > CGRectGetWidth(self.contentView.bounds) - 50 || endPoint.y < 10.0 || endPoint.y > CGRectGetHeight(self.contentView.bounds) - 10.0 || endPoint.x < 10.0) {
                if (self.handleGestureEndBlock) {
                    self.handleGestureEndBlock(YES);
                }
            } else {
                if (self.handleGestureEndBlock) {
                    self.handleGestureEndBlock(NO);
                }
            }
            
            [_snapView removeFromSuperview];
            _containerView.hidden = NO;
            _shadowView.hidden = NO;
        }
            break;
            
        default:
            break;
    }
}

@end
