//
//  ViewController.m
//  NZLib
//
//  Created by AmmalesPSC91 on 6/29/2558 BE.
//  Copyright (c) 2558 psc.com. All rights reserved.
//

#import "ExampleController.h"
#import "AlertUtil.h"
#import "NZLoginController.h"

typedef NS_ENUM(NSInteger, Feature) {
    FeatureAlertUtil = 0,
    FeatureLoginController = 1
};

typedef void(^FeatureBlock)(void);

@interface ExampleController ()
{
    NSMutableArray *list;
    FeatureBlock featureAlertUtil;
    FeatureBlock featureLoginController;
}
@end

@implementation ExampleController

- (void)viewDidLoad {
    [super viewDidLoad];
    __block UIViewController *this = self;
    list = [[NSMutableArray alloc]init];
    [list addObject:[NSNumber numberWithInt:FeatureAlertUtil]];
    [list addObject:[NSNumber numberWithInt:FeatureLoginController]];
    
    featureAlertUtil = ^(void){
        [AlertUtil addMoreButton:@[@"Button1",@"Button2",@"Button3"]];
        [AlertUtil alertWithMessage:@"Hello World!" clickHandler:^(NSInteger buttonNumber) {
            
        }];
    };
    
    featureLoginController = ^(void){
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"LoginSB" bundle:nil];
        NZLoginController *controller = [sb instantiateViewControllerWithIdentifier:@"LoginSB"];
        [this.navigationController presentViewController:controller animated:YES completion:^{
            
        }];
    };
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [list count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    Feature feature = [[list objectAtIndex:indexPath.row] intValue];
    [cell.textLabel setText:[self featureString:feature]];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Feature feature = [[list objectAtIndex:indexPath.row] intValue];
    if (feature == FeatureAlertUtil) {
        featureAlertUtil();
    }else if (feature == FeatureLoginController) {
        featureLoginController();
    }
}
-(NSString *)featureString:(Feature)feature{
    switch (feature) {
        case FeatureAlertUtil:
            return @"AlertUtil";
            break;
        case FeatureLoginController:
            return @"LoginController";
            break;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
