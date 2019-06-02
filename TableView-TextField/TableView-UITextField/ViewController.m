//
//  ViewController.m
//  TableView-UITextField
//
//  Created by LBJames on 2019/2/25.
//  Copyright © 2019年 LBJames. All rights reserved.
//

#import "ViewController.h"
#import "FirstTableViewCell.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,FirstTableViewCellDelegate>
@property(nonatomic, strong) NSMutableArray *dataSource; //!< <#name#>
@property(nonatomic, strong) NSMutableArray *textArray; //!< <#name#>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController

- (NSMutableArray *)dataSource{
    if (_dataSource == nil) {
        _dataSource = [[NSMutableArray alloc] init];
    }
    return _dataSource;
}

- (NSMutableArray *)textArray{
    if (_textArray == nil) {
        _textArray = [[NSMutableArray alloc] init];
    }
    return _textArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.dataSource addObject:@[@"",@"",@"",@"",@"",@""]];
    [self.dataSource addObject:@[@"",@"",@"",@"",@"",@"",@"",@""]];
    
    
    for (int i = 0; i < self.dataSource.count; i++) {
        NSArray *array = self.dataSource[i];
        NSMutableArray *arrayM = [[NSMutableArray alloc] init];
        for (int j = 0; j < array.count; j++) {
            [arrayM addObject:@""];
        }
        [self.textArray addObject:arrayM];
    }
    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"FirstTableViewCell" bundle:nil] forCellReuseIdentifier:@"FirstTableViewCell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView reloadData];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataSource[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    FirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FirstTableViewCell" forIndexPath:indexPath];
    cell.delegate = self;
    cell.indexPath = indexPath;
    cell.nameLabel.text = [NSString stringWithFormat:@"第%zd组第%zd个",indexPath.section,indexPath.row];
    cell.textField.text = self.textArray[indexPath.section][indexPath.row];
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (void)selectFirstTableViewCellWithTextField:(NSString *)text indexPath:(NSIndexPath *)indexPath{
    NSLog(@"%@",text);
    NSMutableArray *arrayM = self.textArray[indexPath.section];
    [arrayM replaceObjectAtIndex:indexPath.row withObject:text];
    [self.textArray replaceObjectAtIndex:indexPath.section withObject:arrayM];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
