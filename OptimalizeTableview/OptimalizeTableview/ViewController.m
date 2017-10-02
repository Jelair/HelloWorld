//
//  ViewController.m
//  OptimalizeTableview
//
//  Created by NowOrNever on 02/10/2017.
//  Copyright © 2017 NowOrNever. All rights reserved.
//

#import "ViewController.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width/3
#define HEIGHT 100

typedef void(^RunloopBlock)(void);
@interface ViewController ()<UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) NSMutableArray *tasks;
@property (nonatomic,assign) NSUInteger *maxQueueLength;

@property (nonatomic,strong) NSTimer *timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.tableView];
    _tasks = [NSMutableArray array];
    _maxQueueLength = 18;
    [self addRunloopObserver];
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.001 target:self selector:@selector(justAMethod) userInfo:nil repeats:YES];
}

- (void)justAMethod{
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1000;
}

+ (void)addImage1:(UITableViewCell *)cell{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    imageView.image = [UIImage imageNamed:@"test.jpg"];
    imageView.tag = 101;
    [cell.contentView addSubview:imageView];
}

+ (void)addImage2:(UITableViewCell *)cell{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH, 0, WIDTH, HEIGHT)];
    imageView.image = [UIImage imageNamed:@"timg.jpeg"];
    imageView.tag = 102;
    [cell.contentView addSubview:imageView];
}

+ (void)addImage3:(UITableViewCell *)cell{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH*2, 0, WIDTH, HEIGHT)];
    imageView.image = [UIImage imageNamed:@"timg-2.jpeg"];
    imageView.tag = 103;
    [cell.contentView addSubview:imageView];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellid" forIndexPath:indexPath];
    
    for (int i = 0; i < 3; i++) {
        [[cell.contentView viewWithTag:i+101] removeFromSuperview];
    }
    [self addTask:^{
        [ViewController addImage1:cell];
    }];
    [self addTask:^{
        [ViewController addImage2:cell];
    }];
    [self addTask:^{
        [ViewController addImage3:cell];
    }];

    return cell;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellid"];
        _tableView.rowHeight = HEIGHT;
        _tableView.dataSource = self;
    }
    return _tableView;
}
#pragma mark -- cfrunloop

- (void)addTask:(RunloopBlock)block{
    [self.tasks addObject:block];
    if (self.tasks.count == _maxQueueLength) {
        [self.tasks removeObjectAtIndex:0];
    }
}

- (void)addRunloopObserver{
    CFRunLoopRef runloop = CFRunLoopGetCurrent();
    CFRunLoopObserverContext context = {
        0,
        (__bridge void *)(self),
        &CFRetain,
        &CFRelease,
        NULL
    };
    CFRunLoopObserverRef defaultObserver = CFRunLoopObserverCreate(NULL, kCFRunLoopAfterWaiting, YES, 0, &callBack, &context);
    
    CFRunLoopAddObserver(runloop, defaultObserver, kCFRunLoopCommonModes);
    CFRelease(defaultObserver);
}

static void callBack(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info){
    ViewController *vc = (__bridge ViewController*)info;
    if (vc.tasks.count == 0) {
        return;
    }
    
    RunloopBlock block = [vc.tasks objectAtIndex:0];
    block();
    [vc.tasks removeObjectAtIndex:0];
}

@end
