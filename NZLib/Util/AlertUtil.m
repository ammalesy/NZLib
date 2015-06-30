//
//  AlertUtil.m
//  NZLib
//
//  Created by AmmalesPSC91 on 6/29/2558 BE.
//  Copyright (c) 2558 psc.com. All rights reserved.
//

#import "AlertUtil.h"

@implementation AlertUtil
@synthesize cancelTitle,okTitle;

static BOOL cancelButtonFlag = NO;
static UIAlertView *alertView = nil;
static NSArray *moreButton = nil;
static AlertUtil *sharedUtil = nil;
static dispatch_once_t m_onceToken;

+ (AlertUtil *)sharedUtil
{
    dispatch_once(&m_onceToken, ^{
        sharedUtil = [[self alloc] init];
    
    });
    [sharedUtil initial];
    return sharedUtil;
}
-(void)initial{
    self.cancelTitle = @"Cancel";
    self.okTitle = @"OK";
}
-(UIAlertView *)instanceWithTitle:(NSString *)title message:(NSString *)message{
    UIAlertView *instance = [[UIAlertView alloc]initWithTitle:title
                                                      message:message
                                                     delegate:self
                                            cancelButtonTitle:(cancelButtonFlag == YES)?nil:cancelTitle
                                            otherButtonTitles:nil];
    [instance addButtonWithTitle:okTitle];
    for( NSString *title in moreButton)  {
        [instance addButtonWithTitle:title];
    }
    alertView = instance;
    return instance;
}
-(UIAlertView *)instanceWithMessage:(NSString *)message{
    return [self instanceWithTitle:nil message:message];
}
+(void)alertWithTitle:(NSString *)title
              message:(NSString *)message
         clickHandler:(void (^)(NSInteger))handler{
    AlertUtil *util = [AlertUtil sharedUtil];
    UIAlertView *instance = [util instanceWithTitle:title message:message];
    [util setHandler:handler];
    [instance show];
}
+(void)alertWithMessage:(NSString *)message
           clickHandler:(void (^)(NSInteger))handler{
    [AlertUtil alertWithTitle:nil message:message clickHandler:handler];
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (self.handler) {
         self.handler(buttonIndex);
    }
}
-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    cancelButtonFlag = NO;
    moreButton = nil;
}
+(UIAlertView *)currentAlertView{
    return alertView;
}
+(void)disableCancelButton:(BOOL)status{
    cancelButtonFlag = status;
}
+(void)addMoreButton:(NSArray *)buttons{
    moreButton = buttons;
}
@end
