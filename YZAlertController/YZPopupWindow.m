//
//  YZPopupWindow.m
//  YZAlertControllerDemo
//
//  Created by 叶志强 on 2018/7/26.
//  Copyright © 2018年 CancerQ. All rights reserved.
//

#import "YZPopupWindow.h"

@interface YZPopupWindow()<UIGestureRecognizerDelegate>

@property (nonatomic, strong) NSMutableArray <__kindof UIView *> *popViews;

@end
@implementation YZPopupWindow


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if ( self )
    {
        self.windowLevel = UIWindowLevelStatusBar + 1;
        
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(actionTap:)];
        gesture.cancelsTouchesInView = NO;
        gesture.delegate = self;
        [self addGestureRecognizer:gesture];
    }
    return self;
}

+ (YZPopupWindow *)sharedWindow{
    static YZPopupWindow *window;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        window = [[YZPopupWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        window.rootViewController = [UIViewController new];
    });
    
    return window;
}

- (void)addSubview:(UIView *)view{
    [super addSubview:view];
    [self.popViews removeAllObjects];
    [self.popViews addObject:view];
}

- (void)actionTap:(UITapGestureRecognizer*)gesture{

}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    return YES;
}

- (UIView *)attachView{
    return self.rootViewController.view;
}

@end
