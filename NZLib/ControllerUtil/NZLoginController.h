//
//  NZLoginController.h
//  NZLib
//
//  Created by AmmalesPSC91 on 6/30/2558 BE.
//  Copyright (c) 2558 psc.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NZLoginController : UIViewController //

@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
@property (weak, nonatomic) IBOutlet UILabel *usernameLB;
@property (weak, nonatomic) IBOutlet UILabel *passwordLB;
@property (weak, nonatomic) IBOutlet UITextField *usernameTxt;
@property (weak, nonatomic) IBOutlet UITextField *passwordTxt;
@property (weak, nonatomic) IBOutlet UIButton *signInButton;
@property (weak, nonatomic) IBOutlet UITextView *detailLB;

- (IBAction)signIn:(id)sender;
- (IBAction)closeAction:(id)sender;


@end
