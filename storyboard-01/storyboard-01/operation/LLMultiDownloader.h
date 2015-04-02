//
//  LLMultiDownloader.h
//  storyboard-01
//
//  Created by lance on 15/4/2.
//  Copyright (c) 2015年 Lance Lan. All rights reserved.
//

#import "LLFileDownLoader.h"

@interface LLMultiDownloader : LLFileDownLoader

- (CGFloat)getTotleSize;
- (CGFloat)getCurrentSize;
- (CGFloat)getCurrentProgress;
- (CGFloat)getSpeedWithSeconds:(NSInteger)seconds;

@end
