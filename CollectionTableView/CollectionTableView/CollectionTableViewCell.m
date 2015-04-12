//
//  CollectionTableViewCell.m
//  CollectionTableView
//
//  Created by li yuanchao on 15/4/10.
//  Copyright (c) 2015年 liyc. All rights reserved.
//

#import "CollectionTableViewCell.h"

@implementation CollectionTableViewCell

- (instancetype)init {
    self = [super init];
    if (self) {
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(collectionCellSelected:)];
        [self addGestureRecognizer:tapGesture];
    }
    return self;
}

- (void)collectionCellSelected:(UITapGestureRecognizer *)sender {
    self.selected = YES;
    if (self.didSelectedCell) {
        self.didSelectedCell();
    }
}

@end
