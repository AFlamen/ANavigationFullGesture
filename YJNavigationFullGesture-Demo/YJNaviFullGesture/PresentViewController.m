//
//  PresentViewController.m
//  自定义转场动画
//
//  Created by yangjie on 16/10/30.
//  Copyright © 2016年 yj. All rights reserved.
//

#import "PresentViewController.h"
#import "UIViewController+YJFullGesture.h"
@interface PresentViewController ()

@end

@implementation PresentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor greenColor];
    
    
    // 关闭全屏手势；
//    self.yj_disabledFullGesture = YES;
    
    
}
- (IBAction)dismiss:(id)sender {
    
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
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
