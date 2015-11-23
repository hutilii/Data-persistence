//
//  ArchiverViewController.m
//  02-数据持久化
//
//  Created by qingyun on 15/11/23.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ArchiverViewController.h"
#import "UserInfoMode.h"



@interface ArchiverViewController ()
@property (weak, nonatomic) IBOutlet UITextField *tUser;
@property (weak, nonatomic) IBOutlet UITextField *tPwd;
@property (weak, nonatomic) IBOutlet UITextField *tUid;
@property (weak, nonatomic) IBOutlet UISwitch *sexSwitch;

@end

@implementation ArchiverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    // Do any additional setup after loading the view from its nib.
}

//归档操作  序列化

- (IBAction)clickSave:(UIButton *)sender {
    
    UserInfoMode *mode = [[UserInfoMode alloc] init];
    mode.username = _tUser.text;
    mode.uid = [_tUid.text integerValue];
    mode.pwd = _tPwd.text;
    mode.sex = _sexSwitch.on;
    
    NSLog(@"%@",mode);
    
    if ([NSKeyedArchiver archiveRootObject:mode toFile:@"/Users/qingyun/Desktop/userInfo"]) {
        NSLog(@"====成功");
    };
}


//解码  反序列化

- (void)loadData
{
    //NSData====>对象
    UserInfoMode *mode = [NSKeyedUnarchiver unarchiveObjectWithFile:@"/Users/qingyun/Desktop/userInfo"];
    if (mode) {
        _sexSwitch.on = mode.sex;
        _tUser.text = mode.username;
        _tPwd.text = mode.pwd;
        _tUid.text = [@(mode.uid) stringValue];
    }
    
}


@end








