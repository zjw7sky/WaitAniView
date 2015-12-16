//
//  ViewController.m
//  WaitAni
//
//  Created by zjw7sky on 15/12/14.
//  Copyright © 2015年 zjw7sky. All rights reserved.
//

#import "ViewController.h"
#import "WaitAniView.h"
#import "WaitAniView2.h"
@interface ViewController ()

@property (nonatomic,strong)WaitAniView2 *loadingHubView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    WaitAniView *loadingHubView = [[WaitAniView alloc] initWithFrame:self.view.bounds];
//    [self.view addSubview:loadingHubView];
//    [loadingHubView showHub];
    
    WaitAniView2 *loadingHubView = [[WaitAniView2 alloc] initWithFrame:CGRectMake(10, 100, 100, 100)];
    [self.view addSubview:loadingHubView]; 
    _loadingHubView = loadingHubView;
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)click:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.selected) { 
        [_loadingHubView startAnimation];
    }else{
        [_loadingHubView stopAnimation];
    }
}

@end
