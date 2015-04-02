//
//  LLMultiDownloader.m
//  storyboard-01
//
//  Created by lance on 15/4/2.
//  Copyright (c) 2015年 Lance Lan. All rights reserved.
//

#import "LLMultiDownloader.h"
#import "LLFileSingleDownloader.h"

#define LLMaxDownloadCount 5

@interface LLMultiDownloader ()
{
    NSMutableArray *_progressArray;
    
    NSTimer *_timer;
    CGFloat _speed;
    
    long long _currentSize;
}

@property (nonatomic, strong) NSMutableArray *singleDownloaders;
@property (nonatomic, assign) long long totalLength;

@end

@implementation LLMultiDownloader

- (void)getFileszie
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:self.url]];
    request.HTTPMethod = @"HEAD";
    
    NSURLResponse *response = nil;
    [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    
    self.totalLength = response.expectedContentLength;
}

- (NSMutableArray *)singleDownloaders
{
    if (!_singleDownloaders) {
        _singleDownloaders = [NSMutableArray array];
        
        [self getFileszie];
        
        long long size = 0;
        
        if (self.totalLength % LLMaxDownloadCount == 0) {
            size = self.totalLength / LLMaxDownloadCount;
        } else {
            size = self.totalLength / LLMaxDownloadCount + 1;
        }
        _progressArray = [NSMutableArray arrayWithCapacity:LLMaxDownloadCount];
        for (int i = 0; i < LLMaxDownloadCount; i ++) {
            LLFileSingleDownloader *singleDownloader = [[LLFileSingleDownloader alloc] init];
            singleDownloader.url = self.url;
            singleDownloader.destPath = self.destPath;
            singleDownloader.begin = i * size;
            singleDownloader.end = singleDownloader.begin + size - 1;
            [_progressArray addObject:@0];
            
            singleDownloader.progressHandle = ^(double progress) {
                NSLog(@"%d -- %f", i, progress);
                [_progressArray replaceObjectAtIndex:i withObject:@(progress)];
            };
            
            [_singleDownloaders addObject:singleDownloader];
        }
        
        [[NSFileManager defaultManager] createFileAtPath:self.destPath contents:nil attributes:nil];
        NSFileHandle *handle = [NSFileHandle fileHandleForWritingAtPath:self.destPath];
        [handle truncateFileAtOffset:self.totalLength];
    }
    
    return _singleDownloaders;
}

- (void)start
{
    [self.singleDownloaders makeObjectsPerformSelector:@selector(start)];
    
    _downloading = YES;
}

- (void)pause
{
    [self.singleDownloaders makeObjectsPerformSelector:@selector(pause)];
    
    _downloading = NO;
    
    [_timer invalidate];
}

- (CGFloat)getTotleSize
{
    return [self convetByteToM:self.totalLength * 1.0];
}


- (CGFloat)getCurrentSize
{
    return [self convetByteToM:[self currentSize]];
}

- (CGFloat)currentSize
{
    CGFloat size = 0.0;
    for (int i = 0; i < self.singleDownloaders.count; i ++) {
        LLFileSingleDownloader *singleDownloader = [self.singleDownloaders objectAtIndex:i];
        
        size += singleDownloader.currentLength;
    }
    
    return size;
}

- (CGFloat)convetByteToM:(CGFloat)size
{
    return size / (1024 * 1024);
}

- (CGFloat)getCurrentProgress
{
    CGFloat progress = 0.0;
    for (int i = 0; i < _progressArray.count; i ++) {
        progress += [[_progressArray objectAtIndex:i] doubleValue];
    }
    
    return progress * 1.0 / LLMaxDownloadCount;
}

- (CGFloat)getSpeedWithSeconds:(NSInteger)seconds
{
    _timer = [NSTimer scheduledTimerWithTimeInterval:seconds target:self selector:@selector(calculateSpeed) userInfo:nil repeats:YES];
    [_timer fire];
    
    return _speed;
}

- (void)calculateSpeed
{
    _speed = ([self currentSize] - _currentSize) * 1.0 / 1024;
    
    _currentSize = [self currentSize];
}

@end
