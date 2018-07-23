//
//  YZAlertController.m
//  YZAlertController
//
//  Created by CancerQ on 2018/7/20.
//  Copyright © 2018年 CancerQ. All rights reserved.
//

#import "YZAlertController.h"

@interface YZAlertController ()
{
    @private
    NSString *__title;
    NSString *__message;
    UIAlertControllerStyle __preferredStyle;
    
}
@property (nonatomic, strong) NSMutableArray<UIAlertAction *> *actions;
@property (nonatomic, strong) NSMutableArray<TextFieldConfigurationHandler> *textFieldConfigurationHandlers;
@property (nonatomic, strong, nullable) UIAlertAction *preferredAction NS_AVAILABLE_IOS(9_0);

@end

@implementation YZAlertController

- (instancetype)init{
    self = [super init];
    if (self) {
        _actions = [NSMutableArray arrayWithCapacity:1];
        _textFieldConfigurationHandlers = [NSMutableArray arrayWithCapacity:0];
        __preferredStyle = UIAlertControllerStyleAlert;
    }
    return self;
}

- (YZAlertController * (^)(NSString *))title{
    return ^id(NSString *title){
        self->__title = title;
        return self;
    };
}

- (YZAlertController * (^)(NSString *))message{
    return ^id(NSString *message){
        self->__message = message;
        return self;
    };
}

- (YZAlertController * (^)(UIAlertControllerStyle))preferredStyle{
    return ^id(UIAlertControllerStyle preferredStyle){
        self->__preferredStyle = preferredStyle;
        return self;
    };
}

- (YZAlertController * (^)(NSString *, ...))addAction:(ActionHandler)handler{
    return ^id(NSString *title, ...){
        UIAlertActionStyle style = ({va_list valist;va_start(valist, title);UIAlertActionStyle style = va_arg(valist, UIAlertActionStyle);va_end(valist);style = (style<=2 && style>=0)?style:UIAlertActionStyleDefault;});
        [self.actions addObject:[UIAlertAction actionWithTitle:title style:style handler:handler]];
        return self;
    };
}

- (YZAlertController *)addTextFieldWithConfigurationHandler:(TextFieldConfigurationHandler)configurationHandler{
    [self->_textFieldConfigurationHandlers addObject:configurationHandler];
    return self;
}

- (void(^)(UIViewController *))showOnCtr{
    return ^void(UIViewController *ctr){
        ctr = ctr?:[UIApplication sharedApplication].keyWindow.rootViewController;
        NSAssert(ctr, @"Set your controller");
        [ctr presentViewController:self.alertController animated:YES completion:nil];
    };
}

- (void(^)(void))show{
    return ^void{
        return self.showOnCtr(nil);
    };
}

+ (YZAlertController * (^)(NSString *))title{
    return [[YZAlertController alloc] init].title;
}

+ (YZAlertController * (^)(NSString *))message{
    return [[YZAlertController alloc] init].message;
}

+ (YZAlertController * (^)(UIAlertControllerStyle))preferredStyle{
    return [[YZAlertController alloc] init].preferredStyle;
}

+ (YZAlertController * (^)(NSString *, ...))addAction:(ActionHandler)handler{
    return [[[YZAlertController alloc] init] addAction:handler];
}

+ (YZAlertController *)addTextFieldWithConfigurationHandler:(TextFieldConfigurationHandler)configurationHandler{
    return [[[YZAlertController alloc] init] addTextFieldWithConfigurationHandler:configurationHandler];
}

- (UIAlertController *)alertController{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:__title message:__message preferredStyle:__preferredStyle];
    for (int i = 0; i<self.actions.count; i++) [alertController addAction:self.actions[i]];
    for (int i = 0; i<self.textFieldConfigurationHandlers.count; i++) [alertController addTextFieldWithConfigurationHandler:self.textFieldConfigurationHandlers[i]];
    return alertController;
}

@end

@implementation NSObject (YZAlertController)

- (void)yz_alertShowWithMessage:(NSString *)message{
    [self yz_alertShowWithTitle:@"Attention" message:message preferredStyle:UIAlertControllerStyleAlert showOnCtr:nil];
}
- (void)yz_warningAlertShowWithMessage:(NSString *)message{
    [self yz_alertShowWithTitle:@"Warning" message:message preferredStyle:UIAlertControllerStyleAlert showOnCtr:nil];
}

- (void)yz_errorAlertShowWithMessage:(NSString *)message{
    [self yz_alertShowWithTitle:@"Error" message:message preferredStyle:UIAlertControllerStyleAlert showOnCtr:nil];
}

- (void)yz_alertShowWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle showOnCtr:(UIViewController *)ctr{
    [[[YZAlertController alloc] init].title(title).message(message).preferredStyle(preferredStyle) addAction:nil](@"OK").showOnCtr(ctr);
}

- (YZAlertController * (^)(NSString *))yz_alertShowWithMessage{
    return [[YZAlertController alloc] init].message;
}

- (YZAlertController * (^)(UIAlertControllerStyle))yz_alertShowWithPreferredStyle{
    return [[YZAlertController alloc] init].preferredStyle;
}

- (YZAlertController * (^)(NSString *))yz_alertShowWithTitle{
    return [[YZAlertController alloc] init].title;
}

- (YZAlertController * (^)(NSString *, ...))yz_alertAddAction:(ActionHandler)handler{
    return [[[YZAlertController alloc] init] addAction:handler];
}

- (YZAlertController *)yz_alertAddTextFieldWithConfigurationHandler:(TextFieldConfigurationHandler)configurationHandler{
    return [[[YZAlertController alloc] init] addTextFieldWithConfigurationHandler:configurationHandler];
}

@end

