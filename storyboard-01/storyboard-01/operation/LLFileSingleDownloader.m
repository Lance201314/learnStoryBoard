//
//  LLFileSingleDownloader.m
//  storyboard-01
//
//  Created by lance on 15/4/2.
//  Copyright (c) 2015年 Lance Lan. All rights reserved.
//

#import "LLFileSingleDownloader.h"

@interface LLFileSingleDownloader () <NSURLConnectionDataDelegate>

@property (nonatomic, strong) NSURLConnection *conn;
@property (nonatomic, strong) NSFileHandle *writeHandle;

@end

@implementation LLFileSingleDownloader

- (NSFileHandle *)writeHandle
{
    if (!_writeHandle) {
        _writeHandle = [NSFileHandle fileHandleForWritingAtPath:self.destPath];
    }
    
    return _writeHandle;
}

- (void)start
{
    NSURL *url = [NSURL URLWithString:self.url];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    NSString *value = [NSString stringWithFormat:@"byte=%lld-%lld", self.begin, + self.currentLength, self.end];
    
    [request setValue:value forHTTPHeaderField:@"Range"];
    
    self.conn = [NSURLConnection connectionWithRequest:request delegate:self];
    
    _downloading = YES;
    
    NSURLSession
}

- (void)pause
{
    [self.conn cancel];
    self.conn = nil;
    
    _downloading = NO;
}

#pragma mark NSURLConnectionDataDelegate

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"connected %@", response.description);
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"error %@", error.description);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    self.currentLength = 0;
    
    [self.writeHandle closeFile];
    self.writeHandle = nil;
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.writeHandle seekToFileOffset:self.begin + self.currentLength];
    [self.writeHandle writeData:data];

    self.currentLength += data.length;
    
    double progress = self.currentLength * 1.0 / (self.end - self.begin);
    if (self.progressHandle) {
        self.progressHandle(progress);
    }
}

@end
