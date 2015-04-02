//
//  LLFileSingleDownloader.h
//  storyboard-01
//
//  Created by lance on 15/4/2.
//  Copyright (c) 2015年 Lance Lan. All rights reserved.
//

#import "LLFileDownLoader.h"

@interface LLFileSingleDownloader : LLFileDownLoader

@property (nonatomic, assign) long long begin;
@property (nonatomic, assign) long long end;
@property (nonatomic, assign) long long currentLength;

@end
