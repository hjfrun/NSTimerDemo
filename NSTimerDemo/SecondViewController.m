//
//  SecondViewController.m
//  NSTimerDemo
//
//  Created by HE Jianfeng on 2017/3/28.
//  Copyright © 2017年 hjfrun. All rights reserved.
//

#import "SecondViewController.h"
#import "NSTimer+WeakTimer.h"

@interface SecondViewController ()

@property (nonatomic, strong) NSTimer *timer;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (nonatomic, assign) NSInteger second;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"第二个页面";
    
//    [self timerWithBlock];
    [self timerWithCatagory];
}

- (void)timerWithCatagory
{
    __weak typeof(self) weakSelf = self;
    self.timer = [NSTimer weakScheduledTimerWithTimeInterval:1.f repeats:YES block:^(NSTimer *timer) {
        __strong typeof(self) strongSelf = weakSelf;
        [strongSelf timerTick:timer];
    }];
}

- (void)timerWithBlock
{
    __weak typeof(self) weakSelf = self;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.f repeats:YES block:^(NSTimer * _Nonnull timer) {
        __strong typeof(self) strongSelf = weakSelf;
        [strongSelf timerTick:timer];
    }];
}

- (void)timerWithSelector
{
    self.timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerTick:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
}

- (void)timerTick:(NSTimer *)timer
{
    NSLog(@"timer tick counts: %zd", ++_second);
    
    self.label.text = [NSString stringWithFormat:@"%zd", _second];
    
    if (_second == 5) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

//- (void)viewDidDisappear:(BOOL)animated
//{
//    [super viewDidDisappear:animated];
//    
//    [self.timer invalidate];
//    self.timer = nil;
//}

- (void)dealloc
{
    NSLog(@"%s---%@", __func__, NSStringFromClass(self.class));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
