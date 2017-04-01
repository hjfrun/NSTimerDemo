//
//  ViewController.m
//  NSTimerDemo
//
//  Created by HE Jianfeng on 2017/3/28.
//  Copyright © 2017年 hjfrun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.f target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
}

- (void)timerAction:(NSTimer *)timer
{
    static NSInteger count = 0;
    self.label.text = [NSString stringWithFormat:@"%zd", ++count];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.timer setFireDate:[NSDate distantFuture]];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.timer setFireDate:[NSDate distantPast]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
