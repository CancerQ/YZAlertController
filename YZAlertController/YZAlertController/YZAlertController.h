//
//  YZAlertController.h
//  YZAlertController
//
//  Created by CancerQ on 2018/7/20.
//  Copyright © 2018年 CancerQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#define AlertShowMessage (message) [self yz_alertShowWithMessage:message]

@class YZAlertController;
typedef void (^__nullable ActionHandler)(UIAlertAction *action);
typedef void (^__nullable TextFieldConfigurationHandler)(UITextField *textField);

@interface YZAlertController : NSObject

/**
 *    Sets the UIAlertController title
 */
- (YZAlertController * (^)(NSString *))title;

/**
 *    Sets the UIAlertController message
 */
- (YZAlertController * (^)(NSString *))message;

/**
 *    Sets the UIAlertController preferredStyle
 */
- (YZAlertController * (^)(UIAlertControllerStyle))preferredStyle;

/**
 *    Add the UIAlertController action with handler
 *    @param block scope within which you can build up the action which your handle.
 */
- (YZAlertController * (^)(NSString *, ...))addAction:(ActionHandler)handler;

/**
 *    Add the UIAlertController TextField of configuration handler
 *    @param block scope within which you can build up the TextField configuration.
 */
- (YZAlertController *)addTextFieldWithConfigurationHandler:(TextFieldConfigurationHandler)configurationHandler;

/**
 *    Sets the UIAlertController display controller
 */
- (void(^)(UIViewController *))showOnCtr;

/**
 *    Show the UIAlertController
 */
- (void(^)(void))show;

/**
 *    Sets the UIAlertController title of class method
 */
+ (YZAlertController * (^)(NSString *))title;

/**
 *    Sets the UIAlertController message of class method
 */
+ (YZAlertController * (^)(NSString *))message;

/**
 *    Sets the UIAlertController preferredStyle of class method
 */
+ (YZAlertController * (^)(UIAlertControllerStyle))preferredStyle;

/**
 *    Add the UIAlertController action with handler 
 */
+ (YZAlertController * (^)(NSString *, ...))addAction:(ActionHandler)handler;

/**
 *    Add the UIAlertController TextField of configuration handler
 */
+ (YZAlertController *)addTextFieldWithConfigurationHandler:(TextFieldConfigurationHandler)configurationHandler;

@end


/** You can extension your method*/
@interface NSObject (YZAlertController)

/**
 *    Sets the YZAlertController with message and an attention title
 */
- (void)yz_alertShowWithMessage:(NSString *)message;

/**
 *    Sets the YZAlertController with message and a warning title
 */
- (void)yz_warningAlertShowWithMessage:(NSString *)message;

/**
 *    Sets the YZAlertController with message an error title
 */
- (void)yz_errorAlertShowWithMessage:(NSString *)message;

/**
 *    Sets the YZAlertController with title,message,preferredStyle and show controller
 */
- (void)yz_alertShowWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle showOnCtr:(UIViewController *)ctr;

/**
 *    Sets the UIAlertController title, like the YZAlertController
 */
- (YZAlertController * (^)(NSString *))yz_alertShowWithTitle;

/**
 *    Sets the UIAlertController message, like the YZAlertController
 */
- (YZAlertController * (^)(NSString *))yz_alertShowWithMessage;

/**
 *    Sets the UIAlertController preferredStyle, like the YZAlertController
 */
- (YZAlertController * (^)(UIAlertControllerStyle))yz_alertShowWithPreferredStyle;

/**
 *    Add the UIAlertController action with handler, like the YZAlertController
 */
- (YZAlertController * (^)(NSString *, ...))yz_alertAddAction:(ActionHandler)handler;

/**
 *    Add the UIAlertController TextField of configuration handler, like the YZAlertController
 */
- (YZAlertController *)yz_alertAddTextFieldWithConfigurationHandler:(TextFieldConfigurationHandler)configurationHandler;
@end

