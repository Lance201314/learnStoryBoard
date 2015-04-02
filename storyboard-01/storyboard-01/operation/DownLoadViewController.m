//
//  DownLoadViewController.m
//  storyboard-01
//
//  Created by lance on 15/4/2.
//  Copyright (c) 2015年 Lance Lan. All rights reserved.
//

#import "DownLoadViewController.h"
#import "LLMultiDownloader.h"

@interface DownLoadViewController ()
{
    NSTimer *_timer;
}

@property (nonatomic, strong) LLMultiDownloader *multiDownloader;
@property (weak, nonatomic) IBOutlet UIProgressView *progress;
@property (weak, nonatomic) IBOutlet UIButton *operationButton;
@property (weak, nonatomic) IBOutlet UILabel *speedLabel;
@property (weak, nonatomic) IBOutlet UILabel *precentProgress;

@property (weak, nonatomic) IBOutlet UILabel *precentSizeLabel;
@end

@implementation DownLoadViewController

- (LLMultiDownloader *)multiDownloader
{
    if (!_multiDownloader) {
        _multiDownloader = [[LLMultiDownloader alloc] init];
        
        _multiDownloader.url = @"http://nb.baidupcs.com/file/b118d9bd0a3b540603b1ea7951775600?bkt=p2-nb-77&fid=1464748776-250528-1071614602715902&time=1427957496&sign=FDTAXERLBH-DCb740ccc5511e5e8fedcff06b081203-MyeTdLwuJVo6zjIkNq9sISTpB%2F4%3D&to=nbb&fm=Nin,B,T,t&newver=1&newfm=1&flow_ver=3&sl=80347212&expires=8h&rt=sh&r=548857500&mlogid=2471578550&vuk=-&vbdid=2977580548&fin=2015-03-28.zip&fn=2015-03-28.zip";
        
        NSString *caches = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
        NSString *filepath = [caches stringByAppendingPathComponent:@"test.zip"];
        _multiDownloader.destPath = filepath;
        
        NSLog(@"filepath ~~%@", filepath);
    }
    
    return _multiDownloader;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)operationAction:(id)sender {
//    if (_invocationOperation == nil) {
//        _invocationOperation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(downloadFile) object:nil];
//    }
//    
//    [_invocationOperation start];
}

- (IBAction)operationStop:(id)sender {
    
    [self.multiDownloader pause];
    
    [_timer invalidate];
}

- (IBAction)operationCancel:(id)sender {
    
    [self.multiDownloader pause];
    
    [_timer invalidate];
}

- (IBAction)downloadFile:(id)sender
{
    [self.multiDownloader start];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateProgress) userInfo:nil repeats:YES];
    
    [_timer fire];
}

- (void)updateProgress
{
    _progress.progress = [self.multiDownloader getCurrentProgress];
    _precentProgress.text = [NSString stringWithFormat:@"%.3f%%", _progress.progress];
    
    _precentSizeLabel.text = [NSString stringWithFormat:@"%.2fM/%.2fM", [self.multiDownloader getCurrentSize], [self.multiDownloader getTotleSize]];
    
    _speedLabel.text = [NSString stringWithFormat:@"%.2fk/s", [self.multiDownloader getSpeedWithSeconds:3]];
}

@end
