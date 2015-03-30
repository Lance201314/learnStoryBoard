//
//  CustomCell.h
//  storyboard-01
//
//  Created by lance on 15/3/30.
//  Copyright (c) 2015年 Lance Lan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIView *containerView;
@property (nonatomic, weak) IBOutlet UIView *shadowView;
@property (nonatomic, strong) void (^handleGestureEndBlock)(BOOL isDelete);

@end
