//
//  RoundButton.h
//  storyboard-01
//
//  Created by Lance Lan on 15/3/31.
//  Copyright (c) 2015年 Lance Lan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef UIView * (^HitTestViewBlock)(CGPoint point, UIEvent *event, BOOL *returnSuper);

@interface RoundButton : UIButton

@property (nonatomic, strong) HitTestViewBlock hitTestViewBlock;

@end
