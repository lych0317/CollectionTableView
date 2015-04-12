//
//  ViewController.m
//  CollectionTableView
//
//  Created by li yuanchao on 15/4/9.
//  Copyright (c) 2015年 liyc. All rights reserved.
//

#import "ViewController.h"
#import "CollectionTableView.h"
#import "CollectionTableViewCell.h"

@interface ViewController () <CollectionTableViewDelegate, CollectionTableViewDataSource>

@property (nonatomic, strong) NSArray *cellDataArray;
@property (nonatomic, strong) NSArray *headerDataArray;
@property (nonatomic, strong) CollectionTableView *collectionTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *data0 = @[@"image_0_0"];
    NSArray *data1 = @[@"image_1_0", @"image_1_1"];
    NSArray *data2 = @[@"image_2_0", @"image_2_1", @"image_2_2", @"image_2_3"];
    NSArray *data3 = @[@"image_3_0"];
    self.cellDataArray = @[data0, data1, data2, data3];

    self.headerDataArray = @[@"header_0", @"header_1", @"header_2", @"header_3"];
    self.collectionTableView = [[CollectionTableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    self.collectionTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.collectionTableView.backgroundColor = [UIColor colorWithRed:240.0 / 255.0 green:240.0 / 255.0 blue:240.0 / 255.0 alpha:1];
    self.collectionTableView.delegate = self;
    self.collectionTableView.dataSource = self;
    self.collectionTableView.collectionDelegate = self;
    self.collectionTableView.collectionDataSource = self;
    [self.view addSubview:self.collectionTableView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.collectionTableView reloadData];
}

#pragma mark - CollectionTableViewDelegate

- (void)collectionTableView:(CollectionTableView *)tableView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"index path section : %d, row : %d", indexPath.section, indexPath.row);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 76;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UITableViewHeaderFooterView *headerView = [[UITableViewHeaderFooterView alloc] initWithFrame:CGRectZero];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    UIImage *image = [UIImage imageNamed:self.headerDataArray[section]];
    imageView.image = image;
    imageView.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    [headerView addSubview:imageView];
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.collectionTableView tableView:tableView heightForRowAtIndexPath:indexPath];
}

- (CGSize)collectionTableView:(CollectionTableView *)tableView sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(450, 150);
}

- (UIEdgeInsets)collectionTableView:(CollectionTableView *)tableView insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 80, 10, 15);
}

- (CGFloat)collectionTableView:(CollectionTableView *)tableView heightBetweenItemAtIndex:(NSInteger)section {
    return 35;
}

#pragma mark - CollectionTableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.cellDataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.collectionTableView tableView:tableView numberOfRowsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.collectionTableView tableView:tableView cellForRowAtIndexPath:indexPath];
}

- (NSInteger)collectionTableView:(CollectionTableView *)tableView numberOfItemsInSection:(NSInteger)section {
    NSArray *array = self.cellDataArray[section];
    return array.count;
}

- (CollectionTableViewCell *)collectionTableView:(CollectionTableView *)tableView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"index path section : %d, row : %d", indexPath.section, indexPath.row);

    CollectionTableViewCell *cell = [[CollectionTableViewCell alloc] init];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    NSArray *array = self.cellDataArray[indexPath.section];

    UIImage *image = [UIImage imageNamed:array[indexPath.row]];
    imageView.image = image;
    imageView.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    cell.backgroundView = imageView;
    return cell;
}

- (UIView *)collectionTableView:(CollectionTableView *)tableView leftViewAtIndexPath:(NSIndexPath *)indexPath {
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectZero];
    UIEdgeInsets edgeInset = [self collectionTableView:tableView insetForSectionAtIndex:indexPath.section];
    CGFloat cellHeight = [self.collectionTableView tableView:tableView heightForRowAtIndexPath:indexPath];
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(edgeInset.left / 2, 0, 1, cellHeight)];
    lineView.backgroundColor = [UIColor colorWithRed:0x32 / 255.0 green:0xb1 / 255.0 blue:0x6c / 255.0 alpha:1];
    [leftView addSubview:lineView];
    return leftView;
}

@end
