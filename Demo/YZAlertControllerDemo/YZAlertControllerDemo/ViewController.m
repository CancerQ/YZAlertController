//
//  ViewController.m
//  YZAlertControllerDemo
//
//  Created by 叶志强 on 2018/7/23.
//  Copyright © 2018年 CancerQ. All rights reserved.
//

#import "ViewController.h"
#import "YZAlertController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [[[[[[YZAlertController.title(@"title").message(@"message").preferredStyle(UIAlertControllerStyleAlert)
          addAction:nil](@"Action1", UIAlertActionStyleDestructive)
         addAction:nil](@"Action", UIAlertActionStyleDefault)
        addAction:^(UIAlertAction *action) {
            NSLog(@"action title is:%@",action.title);
        }](@"Action", UIAlertActionStyleCancel)
       addTextFieldWithConfigurationHandler:^(UITextField *textField) {
           textField.placeholder = @"textField";
       }]addTextFieldWithConfigurationHandler:^(UITextField *textField) {
           textField.placeholder = @"textField";
       }]addTextFieldWithConfigurationHandler:^(UITextField *textField) {
           textField.placeholder = @"textField";
           textField.backgroundColor = [UIColor redColor];
       }].showOnCtr(self);
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
