//
//  ViewController.m
//  NZLib
//
//  Created by AmmalesPSC91 on 6/29/2558 BE.
//  Copyright (c) 2558 psc.com. All rights reserved.
//

#import "ExampleController.h"
#import "AlertUtil.h"

typedef NS_ENUM(NSInteger, Feature) {
    FeatureAlertUtil = 0
};

@interface ExampleController ()
{
    NSMutableArray *list;
}
@end

@implementation ExampleController

- (void)viewDidLoad {
    [super viewDidLoad];
    list = [[NSMutableArray alloc]init];
    
    [list addObject:[NSNumber numberWithInt:FeatureAlertUtil]];
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
        [AlertUtil alertWithMessage:[self featureString:feature] clickHandler:^(NSInteger buttonNumber) {

        }];
    }
}
-(NSString *)featureString:(Feature)feature{
    switch (feature) {
        case FeatureAlertUtil:
            return @"AlertUtil";
            break;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
