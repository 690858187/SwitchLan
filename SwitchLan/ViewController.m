//
//  ViewController.m
//  SwitchLan
//
//  Created by lyh on 2018/6/4.
//  Copyright © 2018年 lyh. All rights reserved.
//

#import "ViewController.h"
#import "SwitchLan.h"
#import "NSBundle+SwitchLan.h"
#import <Photos/Photos.h>

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *lans;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (IBAction)rightButtonAction:(UIBarButtonItem *)sender {
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
    }];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = self.lans[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.lans.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [NSBundle switchLan:self.lans[indexPath.row]];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    vc.title = self.lans[indexPath.row];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    
    [UIApplication sharedApplication].keyWindow.rootViewController = nav;
}

- (NSArray *)lans {
    if (!_lans) {
        _lans = [NSArray arrayWithArray:[[SwitchLan shareInitialize]allLanguages]];
    }
    return _lans;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
