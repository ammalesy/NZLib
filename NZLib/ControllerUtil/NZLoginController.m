//
//  NZLoginController.m
//  NZLib
//
//  Created by AmmalesPSC91 on 6/30/2558 BE.
//  Copyright (c) 2558 psc.com. All rights reserved.
//

#import "NZLoginController.h"

@interface NZLoginController ()

@end

@implementation NZLoginController

+(NZLoginController *)controller{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"LoginSB" bundle:nil];
    return [sb instantiateViewControllerWithIdentifier:@"LoginSB"];
}
+(NZLoginController *)controllerWithViewDelegate:(id<NZLoginViewDelegate>)viewDelegate
                                  handleEventDelegate:(id<NZLoginHandleEventDelegate>)handleEventDelegate{
    NZLoginController *controller = [NZLoginController controller];
    controller.handleDelegate = handleEventDelegate;
    controller.viewDelegate = viewDelegate;
    return controller;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    if ([[self viewDelegate] respondsToSelector:@selector(NZLoginViewDidLoad:)]) {
        [[self viewDelegate] NZLoginViewDidLoad:self];
    }
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if ([[self viewDelegate] respondsToSelector:@selector(NZLoginViewWillAppear:)]) {
        [[self viewDelegate] NZLoginViewWillAppear:self];
    }
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if ([[self viewDelegate] respondsToSelector:@selector(NZLoginViewDidAppear:)]) {
        [[self viewDelegate] NZLoginViewDidAppear:self];
    }
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    if ([[self viewDelegate] respondsToSelector:@selector(NZLoginViewDidDisappear:)]) {
        [[self viewDelegate] NZLoginViewDidDisappear:self];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


- (IBAction)signIn:(id)sender {
}

- (IBAction)closeAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
@end
