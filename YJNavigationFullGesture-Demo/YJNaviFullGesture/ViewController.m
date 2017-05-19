//
//  ViewController.m
//  YJNaviFullGesture
//
//  Created by yangjie on 16/11/5.
//  Copyright © 2016年 yj. All rights reserved.
//

#import "ViewController.h"
#import "PresentViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.view.backgroundColor = [UIColor redColor];
    
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
    
    PresentViewController *p = [PresentViewController new];
    
    [self.navigationController pushViewController:p animated:YES];
}


@end
