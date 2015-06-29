//
//  AlertUtil.h
//  NZLib
//
//  Created by AmmalesPSC91 on 6/29/2558 BE.
//  Copyright (c) 2558 psc.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AlertUtil : NSObject<UIAlertViewDelegate>

@property(nonatomic,strong)NSString *cancelTitle;
@property(nonatomic,strong)NSString *okTitle;
@property (nonatomic, copy) void (^handler)(NSInteger buttonNumber);

+(UIAlertView *)currentAlertView;
+ (AlertUtil *)sharedUtil;

+(void)alertWithMessage:(NSString *)message
          clickHandler:(void (^)(NSInteger buttonNumber))handler;
+(void)alertWithTitle:(NSString *)title
              message:(NSString *)message
        clickHandler:(void (^)(NSInteger buttonNumber))handler;


@end
