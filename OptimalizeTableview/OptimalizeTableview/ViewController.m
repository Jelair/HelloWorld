//
//  ViewController.m
//  OptimalizeTableview
//
//  Created by NowOrNever on 02/10/2017.
//  Copyright © 2017 NowOrNever. All rights reserved.
//

#import "ViewController.h"
#import "ITableViewCell.h"
@interface ViewController ()<UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.tableView];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellid"];
    
    if (!cell) {
        cell = [[ITableViewCell alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 120)];
    }
    
    cell.imageview1.image = [UIImage imageNamed:@"test.jpg"];
    cell.imageview2.image = [UIImage imageNamed:@"timg-2.jpeg"];
    cell.imageview3.image = [UIImage imageNamed:@"timg.jpeg"];
    return cell;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];

        _tableView.rowHeight = 120;
        _tableView.dataSource = self;
    }
    return _tableView;
}

@end
