//
//  CustomHitTestView.h
//  storyboard-01
//
//  Created by lance on 15/4/1.
//  Copyright (c) 2015年 Lance Lan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef UIView * (^CustomHitTestViewBlock)(CGPoint point, UIEvent *event, BOOL *returnSuper);

@interface CustomHitTestView : UIView

@property (nonatomic, strong) CustomHitTestViewBlock hitTestViewBlock;

@end
