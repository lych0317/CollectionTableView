//
//  CollectionTableView.m
//  CollectionTableView
//
//  Created by li yuanchao on 15/4/9.
//  Copyright (c) 2015年 liyc. All rights reserved.
//

#import "CollectionTableView.h"
#import "UIView+Coordinate.h"

#define CellReuseIdentifier @"CellReuseIdentifier"

@interface CollectionTableView ()

@end

@implementation CollectionTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.allowsSelection = NO;
        [self registerClass:[UITableViewCell class] forCellReuseIdentifier:CellReuseIdentifier];
    }
    return self;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger itemNumber = [self numberOfItemsInSection:indexPath.section];
    if (itemNumber > 0) {
        CGSize itemSize = [self itemSizeAtIndexPath:indexPath];
        UIEdgeInsets edgeInset = [self sectionInsetAtIndex:indexPath.section];
        CGFloat heightBetweenItem = [self heightBetweenItemAtIndex:indexPath.section];
        CGFloat collectionWidth = tableView.width - edgeInset.left - edgeInset.right;
        NSInteger columnContainNumber = collectionWidth / itemSize.width;
        if (columnContainNumber > 0) {
            NSInteger rowNumber =(itemNumber - 1) / columnContainNumber + 1;
            return edgeInset.top + edgeInset.bottom + rowNumber * itemSize.height + (rowNumber - 1) * heightBetweenItem;
        } else {
            NSLog(@"ERROR: width of item > collection width");
        }
    }
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellReuseIdentifier];
    cell.backgroundColor = [UIColor clearColor];
    [self setupCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)setupCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    NSInteger itemNumber = [self numberOfItemsInSection:indexPath.section];
    CGSize itemSize = [self itemSizeAtIndexPath:indexPath];
    UIEdgeInsets edgeInset = [self sectionInsetAtIndex:indexPath.section];
    CGFloat cellHeight = [self tableView:self heightForRowAtIndexPath:indexPath];
    CGFloat heightBetweenItem = [self heightBetweenItemAtIndex:indexPath.section];
    CGRect collectionFrame = CGRectMake(edgeInset.left, edgeInset.top, self.width - edgeInset.left - edgeInset.right, cellHeight - edgeInset.top - edgeInset.bottom);
    CGFloat x = collectionFrame.origin.x;
    CGFloat y = collectionFrame.origin.y;

    NSInteger columnContainNumber = collectionFrame.size.width / itemSize.width;
    if (columnContainNumber > 0) {
        CGFloat itemStep = (collectionFrame.size.width - columnContainNumber * itemSize.width) / (columnContainNumber - 1);
        NSInteger rowNumber =(itemNumber - 1) / columnContainNumber + 1;
        for (int row = 0; row < rowNumber; row++) {
            NSInteger columnNumber = 0;// = ;
            if (itemNumber - columnContainNumber * row > columnContainNumber) {
                columnNumber = columnContainNumber;
            } else {
                columnNumber = itemNumber - columnContainNumber * row;
            }
            for (int column = 0; column < columnNumber; column++) {
                UICollectionViewCell *collectionCell = [self cellForItemAtIndexPath:indexPath];
                UIView *leftView = [self leftViewAtIndexPath:indexPath];
                if (leftView) {
                    leftView.frame = CGRectMake(0, 0, edgeInset.left, cellHeight);
                    [cell addSubview:leftView];
                }
                collectionCell.frame = CGRectMake(x + (itemSize.width + itemStep) * column, y + (itemSize.height + heightBetweenItem) * row, itemSize.width, itemSize.height);
                [cell addSubview:collectionCell];
            }
        }
    } else {
        NSLog(@"ERROR: width of item > collection width");
    }
}

#pragma mark - get object from collection protocol

- (CGSize)itemSizeAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.collectionDelegate respondsToSelector:@selector(collectionTableView:sizeForItemAtIndexPath:)]) {
        return [self.collectionDelegate collectionTableView:self sizeForItemAtIndexPath:indexPath];
    }
    return CGSizeZero;
}

- (UIEdgeInsets)sectionInsetAtIndex:(NSInteger)section {
    if ([self.collectionDelegate respondsToSelector:@selector(collectionTableView:insetForSectionAtIndex:)]) {
        return [self.collectionDelegate collectionTableView:self insetForSectionAtIndex:section];
    }
    return UIEdgeInsetsZero;
}

- (CGFloat)heightBetweenItemAtIndex:(NSInteger)section {
    if ([self.collectionDelegate respondsToSelector:@selector(collectionTableView:heightBetweenItemAtIndex:)]) {
        return [self.collectionDelegate collectionTableView:self heightBetweenItemAtIndex:section];
    }
    return 10;
}

- (NSInteger)numberOfItemsInSection:(NSInteger)section {
    if ([self.collectionDataSource respondsToSelector:@selector(collectionTableView:numberOfItemsInSection:)]) {
        return [self.collectionDataSource collectionTableView:self numberOfItemsInSection:section];
    }
    return 0;
}

- (UICollectionViewCell *)cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.collectionDataSource respondsToSelector:@selector(collectionTableView:cellForItemAtIndexPath:)]) {
        return [self.collectionDataSource collectionTableView:self cellForItemAtIndexPath:indexPath];
    }
    return nil;
}

- (UIView *)leftViewAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.collectionDataSource respondsToSelector:@selector(collectionTableView:leftViewAtIndexPath:)]) {
        return [self.collectionDataSource collectionTableView:self leftViewAtIndexPath:indexPath];
    }
    return nil;
}

@end
