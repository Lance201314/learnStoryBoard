//
//  LLFileDownLoader.h
//  storyboard-01
//
//  Created by lance on 15/4/2.
//  Copyright (c) 2015年 Lance Lan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LLFileDownLoader : NSObject
{
    BOOL _downloading;
}

@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *destPath;
@property (nonatomic, readonly, getter=isDownloading) BOOL downloading;
@property (nonatomic, strong) void (^progressHandle)(double progress);

- (void)start;

- (void)pause;

@end
