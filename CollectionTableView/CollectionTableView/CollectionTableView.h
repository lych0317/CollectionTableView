//
//  CollectionTableView.h
//  CollectionTableView
//
//  Created by li yuanchao on 15/4/9.
//  Copyright (c) 2015年 liyc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CollectionTableView;

@protocol CollectionTableViewDelegate <UITableViewDelegate>

- (void)collectionTableView:(CollectionTableView *)tableView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

- (CGSize)collectionTableView:(CollectionTableView *)tableView sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
- (UIEdgeInsets)collectionTableView:(CollectionTableView *)tableView insetForSectionAtIndex:(NSInteger)section;
- (CGFloat)collectionTableView:(CollectionTableView *)tableView heightBetweenItemAtIndex:(NSInteger)section;

@end

@protocol CollectionTableViewDataSource <UITableViewDataSource>

- (NSInteger)collectionTableView:(CollectionTableView *)tableView numberOfItemsInSection:(NSInteger)section;

- (UICollectionViewCell *)collectionTableView:(CollectionTableView *)tableView cellForItemAtIndexPath:(NSIndexPath *)indexPath;

- (UIView *)collectionTableView:(CollectionTableView *)tableView leftViewAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface CollectionTableView : UITableView

@property (nonatomic, assign) id<CollectionTableViewDelegate> collectionDelegate;
@property (nonatomic, assign) id<CollectionTableViewDataSource> collectionDataSource;

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@end
