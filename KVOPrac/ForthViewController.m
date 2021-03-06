//
//  ForthViewController.m
//  KVOPrac
//
//  Created by Mac on 16/3/28.
//  Copyright © 2016年 Ada. All rights reserved.
//

#import "ForthViewController.h"
#import "SingleColor.h"

@interface ForthViewController ()

@end

@implementation ForthViewController
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [[SingleColor sharedSingleColor]addObserver:self forKeyPath:@"color" options: NSKeyValueObservingOptionNew context:nil];
    self.view.backgroundColor = [SingleColor sharedSingleColor].color;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    
    leftButton.frame = CGRectMake(10, 100, 80, 50);
    [leftButton setTitle:@"改变颜色" forState:UIControlStateNormal];
    leftButton.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1.0];
    [self.view addSubview:leftButton];
    
    [leftButton addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventTouchUpInside ];
}



-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    
    UIColor *color = (UIColor *)change[@"new"];
    self.view.backgroundColor = color;
}
-(void)changeColor:(UIButton *)sender{
    
    [SingleColor sharedSingleColor].color = sender.backgroundColor;
    
    
}
-(void)dealloc{
    
    [[SingleColor sharedSingleColor]removeObserver:self forKeyPath:@"color"];
    
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
